# Issue

**Title:** Fastsrm

## Description

Solves #416 .
This PR introduces FastSRM.  On large datasets, it is faster and more memory efficient that the original algorithm with equivalent performance.

The API used is a bit different from the original SRM algorithm for the following reasons:
- This algorithm is intended to be used on very large dataset that do not hold in memory. Hence input of the algorithms are arrays of .npy files (masked data) of shape [n_subjects, n_sessions] and not a list of np arrays.
- The .npy files are arrays of shape (n_timeframes, n_voxels) and not (n_voxels, n_timeframes). This is to be consistent with the sklearn API (n_samples, n_features).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2e85f0e5b95d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.