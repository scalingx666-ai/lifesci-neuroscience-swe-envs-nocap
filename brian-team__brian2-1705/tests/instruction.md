# Issue

**Title:** Latest numpy no longer has `ndarray.ptp`

## Description

The `ptp` method was still around until numpy 2.3, even though the numpy 2.0 migration guide already listed it as removed: https://numpy.org/devdocs/numpy_2_0_migration_guide.html#ndarray-and-scalar-methods

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4b3fe6192b2e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.