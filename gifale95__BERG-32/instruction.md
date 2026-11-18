# Issue

**Title:** In silico EEG generation bug (np.squeeze).

## Description

Removed `np.squeeze` from in silico EEG generation code.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fe46d19aa6a0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.