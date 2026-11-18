# Issue

**Title:** Fix the catalogue defects from the full-dataset sweep (#1142, #1143 items 1–3)

## Description

and fixes items 1–3 of #1143 (item 4, the MartinezCagigal2023Pary subject-16 epoch-length inconsistency, is upstream data and stays open).

## BNCI2022_001 — 364 GiB epoching (#1143.1)
Only `trajectory_start` is a trial event now (32 bounded, non-overlapping 90 s epochs per subject); the loader annotates each held trigger pulse once (rising edge) instead of once per sample. **Verified with the real TU Graz subject-1 file: develop produces exactly 33,114 annotations — the issue's MemoryError shape — vs 1,152 with the fix** (32 start / 32 end / 742 hit / 346 miss). Waypoint markers stay on the loader's raws.

## Kaneshiro2015 — wrong paradigm tag (#1143.2)
Retagged `p300` → `imagery` (the established convention for non-MI multiclass datasets, cf. BNCI2022_001, Shin2017); catalog row and `api.rst` grouping moved with it. `MotorImagery()`/`Imagery()` now accept the dataset and resolve all six classes; P300 correctly still rejects it.

## RestingStateToP300Adapter — unusable defaults (#1143.3)
`events=None` now means all of the dataset's events (net +0 lines).

## Lee2024 — 345 silently dropped files (#1142)
`data_path` no longer guesses filenames and swallows failures. It downloads a **real inventory** — the NEMAR deposit's provenance manifest when the sourcedata store is in use (**the NEMAR path never contacts the upstream host**), or the upstream git tree otherwise — and routes every file through the shared `data_dl`, which also serves the bytes from the NEMAR store (S3). Subject 8's unpadded `sub8_*` names are normalized to the padded names the loader reads; training-form mixtures and `param.mat` fall out of the inventory; any failure raises. All claims were verified against the upstream git tree directly, and a full redownload on Expanse now matches upstream file-for-file (only the 5 non-data `info.md` docs are absent by design).

## Verification
- 367 passed across `test_bnci` / `test_dataset_fixes` / `test_paradigms` / `test_metadata`; 36 pass on the Lee2024 selection; ruff check/format clean
- New regression tests: trigger-pulse dedup + bounded epoching (fail on develop, verified from a neutral cwd), Kaneshiro paradigm acceptance, adapter defaults, Lee2024 inventory-driven download incl. the NEMAR-manifest branch

## Deliberate follow-ups (out of scope here)
- A first-class `ERP` paradigm so visual-ERP datasets stop borrowing the `imagery` tag (4th dataset to do so)
- Move the `events=None` default into `BaseParadigm.used_events` (currently repeated in 4 paradigms)
- A dataset-declared `preserved_annotations` set so point markers survive `SetRawAnnotations`
- Loader consumption of the per-block training files that are now downloaded for completeness

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d31fde21d072`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.