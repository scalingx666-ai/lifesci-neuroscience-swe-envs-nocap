# Issue

**Title:** [numpy] Replace uses of np.in1d with np.isin(...).ravel().

## Description

[numpy] Replace uses of np.in1d with np.isin(...).ravel().

np.in1d is removed in NumPy 2.4.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `004313cf09f1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.