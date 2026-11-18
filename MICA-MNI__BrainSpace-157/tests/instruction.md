# Issue

**Title:** Allow spectrum='nonzero' with no zero eigenvalue

## Description

Supersedes #112.

@jordandekraker's bug report is real: a weight matrix with no kernel (e.g. hippocampal-subfield surfaces with no medial wall) shouldn't raise. The original PR removed the guard outright, but that silently corrupts the `spectrum='all'` branch — `mask_zero.argmax()` returns `0` when nothing is True, so the code drops the **largest** eigenvalue instead of a zero one.

This PR makes the guard branch-aware:
- `spectrum='all'` still requires `n_zero >= 1` and now raises a clearer message pointing at `spectrum='nonzero'`.
- `spectrum='nonzero'` accepts kernel-free matrices and returns all eigenvalues.

Plus two regression tests covering both branches.

@jordandekraker is credited as Co-author on the squashed commit.

## Test plan
- [x] `pytest brainspace/tests/test_null_models.py` → 6 passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `baec08b83042`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.