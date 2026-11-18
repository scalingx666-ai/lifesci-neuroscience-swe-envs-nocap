# Issue

**Title:** Parallelize nonlinear T2*/S0 estimation and RobustICA

## Description

.

Changes proposed in this pull request:

- Use joblib to parallelize the curve_fit function calls.
- Use tqdm to make pretty progress bars.
- Pass the `n_threads` parameter to RobustICA as well.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ac5007229a73`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.