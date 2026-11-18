# Issue

**Title:** Support path-like and vectorized inputs in GradientMaps.fit

## Description

.

## Summary
- `GradientMaps.fit` now accepts path-like objects (`str`, `bytes`, `os.PathLike`), or lists of them, pointing to `.npy` files. Each file is loaded lazily with `np.load` immediately before its affinity matrix is computed, so large connectivity matrices don't all need to live in memory at once.
- Adds `vectorized=False` / `discard_diagonal=False` kwargs that reconstruct a symmetric square matrix from its lower-triangular vector — the format produced by `nilearn.connectome.ConnectivityMeasure(vectorize=True)` — halving on-disk footprint when paired with path inputs.
- Path-like and vectorized inputs work with single matrices, lists, and both `procrustes` and `joint` alignment.

## Test plan
- [x] New tests in `brainspace/tests/test_gradient_path_inputs.py` cover devectorization (with and without diagonal), path loading (`str` and `pathlib.Path`), single/list path inputs, vectorized inputs, and joint alignment with vectorized path inputs. Each verifies bit-for-bit equivalence with the in-memory ndarray path.
- [x] Existing gradient/alignment tests still pass.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6d6144d36a17`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.