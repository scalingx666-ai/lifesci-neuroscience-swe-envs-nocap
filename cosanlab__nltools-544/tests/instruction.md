# Issue

**Title:** fix: hygiene sweep slice E — Simulator, mask, atlases, brain space

## Description

Slice S-E of the 0.6.0 hygiene sweep (#535): Simulator, datasets, templates (brain space), atlases and mask. Every finding was reproduced before it was fixed; each behavioural change carries the test that failed on master.

Findings fixed (ids from the #535 tracker): E-01, E-02, E-03, E-04, E-05, E-06, E-07, E-08, E-09, E-10, E-11, E-12, E-13, E-14, E-15, E-16, E-17, E-18.

Behavioural:
- `collapse_mask` works outside template space and no longer labels pairwise overlaps as a third region (one rewrite; closed bug #126's round trip and int32 dtype hold).
- `_detect_resolution` reads voxel sizes from the affine's columns, so a rotated or permuted affine is no longer reported isotropic at 0 mm and template matching stops picking the wrong resolution.
- A custom `brain_mask` passed to `Simulator` is kept rather than silently resampled onto the MNI template; the mask is resolved once at construction. Default output is byte-identical, and so is `load_haxby_example`.
- Simulator covariance is symmetric; `create_ncov_data` draws fresh noise per repetition; `SimulateGrid` initialises its result attributes and forwards `correction`.
- Cluster reports keep 26-connectivity as the single cluster definition; peak extents come from the renumbered label volume; a voxel exactly at the threshold is excluded (documented, unlike `BrainData.threshold`'s inclusive cutoffs).
- `roi_labels` containing 0 raises instead of being skipped; sphere and mask helpers validate their inputs.

Docstring and mechanical: `fetch_neurovault_collection` names its wrapped call; the two parked workflow notebooks import `fetch_resource` from `nltools.datasets`.

Migration rows: fourteen, under new Simulator, Masks, Cluster reports and Brain space blocks.

Gates: `uv run poe ok` after rebase onto c85e2411, the touched test files at `-m ''`, strict docs build. The Pyodide transport in `nltools/templates/fetch.py` is untouched.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c85e2411b96a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.