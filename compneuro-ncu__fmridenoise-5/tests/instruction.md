# Issue

**Title:** Added baseline confounds summary measures

## Description

Added output of the `Confounds` interface that returns a dictionary of basic summary of confounds regressors, including: mean FD (`mean_fd`), max FD (`max_fd`), number of spikes (`n_spikes`), number of confounds (`n_conf`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fbcd39a9d435`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.