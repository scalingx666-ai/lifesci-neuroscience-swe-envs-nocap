# Issue

**Title:** fix DeprecationWarning

## Description

DeprecationWarning: Please import `gaussian_filter` from the `scipy.ndimage` namespace; the `scipy.ndimage.filters` namespace is deprecated and will be removed in SciPy 2.0.0.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `33a97b52038e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.