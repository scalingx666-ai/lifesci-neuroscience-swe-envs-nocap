# Issue

**Title:** Move NaN/Inf and n_components validation into embedding entry points

## Description

.

## Summary
- Add `_check_finite` and `_check_n_components` helpers in [`brainspace/gradient/embedding.py`](brainspace/gradient/embedding.py).
- Call them at the top of `diffusion_mapping` and `laplacian_eigenmaps`. `DiffusionMaps.fit` / `LaplacianEigenmaps.fit` now also reject bad inputs (they delegate to those functions).
- The NaN/Inf check that was already in `GradientMaps._fit_one` stays — both layers are now defensive in depth and the check is idempotent when reached twice.
- The new `n_components` guard prevents the cryptic ARPACK `k must be 1<=k<n` error users hit when asking for too many components on small affinity matrices.

## Test plan
- [x] New tests in [`brainspace/tests/test_embedding_validation.py`](brainspace/tests/test_embedding_validation.py) cover NaN, Inf, too-large `n_components`, zero/negative `n_components`, and class wrappers.
- [x] Full suite still passes (132 + 7 new = 139 passed).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d1c514a9a466`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.