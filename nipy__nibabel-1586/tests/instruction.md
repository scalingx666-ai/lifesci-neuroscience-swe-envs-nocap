# Issue

**Title:** BF: Avoid integer overflow when computing voxel sizes

## Description

`voxel_sizes()` squares integer affine entries before taking a square root. An int8 diagonal affine with voxel size 20 returns NaNs; uint8 silently returns 12.

Use `numpy.linalg.norm`, which promotes integer inputs before computing the norm, and normalize the documented array-like input with `asarray`. Regressions cover signed integer widths, unsigned int8, input non-mutation and nested lists.

Validation: the initial integer/array-like regressions produced 5 failures on the original source. The final affines, processing and orientations tests pass: 32 passed, including 15 affines cases. Ruff lint, format checks and `git diff --check` pass. Python 3.12.14, NumPy 2.5.4, SciPy 1.18.1. The full suite was not completed; no whole-suite result is claimed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fdacbf05c15f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.