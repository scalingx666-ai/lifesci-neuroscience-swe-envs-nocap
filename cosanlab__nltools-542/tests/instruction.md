# Issue

**Title:** fix: hygiene sweep slice H — models, backends, alignment

## Description

Slice S-H of the 0.6.0 hygiene sweep (#535): models, compute backends, alignment, searchlight neighborhoods and cross-validation. Every finding was reproduced before it was fixed; each behavioural change carries the test that failed on master.

Findings fixed (ids from the #535 tracker): H-02, H-03, H-04, H-05, H-06, H-07, H-08, H-09 (+ the B-12 call site), H-10, H-11, H-12, H-13, H-15.

Behavioural:
- Group Procrustes no longer wraps zero-padded arrays in a BrainData whose mask has fewer voxels; it raises and points at the ndarray path (migration row).
- OOM recovery in `backends.py` retries outside the exception handler so the failed call's arrays are released first.
- SRM estimators reject `n_features` larger than a subject's voxel count (the deterministic estimator silently truncated, the probabilistic one raised an opaque broadcast error).
- Ridge scores a NaN target as NaN instead of 0.0, and predicts once per fit through one `_r2_from_predictions` helper shared by `score` and the fit record.
- Correlation alignment converts integer inputs to float before replacing zero-variance columns.
- Searchlight neighborhoods require a 3-D mask.
- Single-unit alignment no longer raises `TypeError`; the four ISC loops are one loop that reduces each unit's upper triangle directly (bit-identical to master across every method × axis × input combination).
- `KFoldStratified` rejects multi-target `y`.

Mechanical: the Procrustes permutation worker returns only the scalar disparity (identical null, far smaller payload); one shared SRM transform update; dead golden arrays and helpers dropped from the Procrustes tests; estimator docstrings name the wrapped callables.

Held back by decision: H-01 (SRM noise trace on uncentred data) keeps brainiak parity for 0.6.0, . Follow-ups filed: #540, #541.

Gates: `uv run poe ok`, the nine touched test files at `-m ''`, strict docs build.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9e75562dac84`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.