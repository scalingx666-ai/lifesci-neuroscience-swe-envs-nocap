# Issue

**Title:** Implement #274 (histology bit-flip), #343 (Destrieux atlas), #341 (resilient Neurosynth fetch)

## Description

## Summary

Folds three open issues into a single PR. Each is independently scoped, but they're small enough that one PR keeps the review queue tidy.

###  — Flip the bits on the histological profiles

`read_histology_profile` now returns 8-bit intensities so that higher = darker = more cell-dense, matching Paquola et al. 2021 (eLife) and the convention used in most downstream BigBrain analyses. Behaviour is gated on a new `invert: bool = True` parameter; pass `invert=False` to recover the raw BigBrainWarp values.

MPC and gradient computations (`compute_mpc`, `compute_histology_gradients`) are correlation-based and therefore invariant to a global sign flip — they produce identical results either way. Only code that inspects raw profile intensities directly will see a difference.

###  (in part) — atlas coverage for FreeSurfer-based GLM workflows

`fetch_parcellation(template, "destrieux", ...)` now returns FreeSurfer's `aparc.a2009s` (Destrieux 2009) parcellation, sourced via `nilearn.datasets.fetch_atlas_surf_destrieux`. Native `fsaverage5`; other `fsaverage*` templates are resampled with nearest-neighbour interpolation. `fslr32k` is rejected with a clear error since the atlas is FreeSurfer-specific.

This is the closest off-the-shelf option BrainStat can ship without hosting new data files. The original ask included `aparc` (Desikan-Killiany); that one needs a download URL and a small server-side change, so it's flagged as a follow-up rather than rolled in here.

###  — Neurosynth fetch fails on interrupted downloads

`meta_analytic_decoder/fetch_neurosynth_data` was leaving truncated `.zip` files on disk after a partial `websave`, then crashing on the next call with `Invalid ZIP file`. Now:
- Each download attempt is followed by a `java.util.zip.ZipFile`-based integrity check that opens the central directory without extracting (the archive is multi-GB, so we can't afford to extract a probe copy).
- `websave → verify → unzip` is wrapped in a 3-attempt retry loop; partial zips are deleted between attempts.
- If the final extracted file count doesn't match the manifest, we raise with a remediation hint pointing at the data directory.
- `find_files` no longer errors when `data_dir` doesn't exist yet.

## Test plan

- [x] `pytest brainstat/tests/test_datasets.py` — 21 passed, 1 skipped.
- [x] `read_histology_profile`'s new `invert` parameter is honoured (signature inspection); default is `True`.
- [x] `fetch_parcellation(..., \"destrieux\", ...)` route exercised through Python.
- [ ] CI: full Python + MATLAB matrix.
- [ ] Manual: confirm the Neurosynth retry path on a network-throttled run (hard to reproduce in CI; verified by reading the code path).

## Out of scope (kept open as separate trackers)

- #342 — Volumetric mixed effects: needs a substantial refactor of the SLM RFT/cluster path. Tracked.
- #199 — Remove `# type: ignore` from SLM: blocked on upstream `python/mypy#10521`.
- aparc/Desikan-Killiany hosted version of #343: needs a new `data_urls.json` entry once a stable host (OSF / Zenodo) is decided.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ec7e96c4ef9d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.