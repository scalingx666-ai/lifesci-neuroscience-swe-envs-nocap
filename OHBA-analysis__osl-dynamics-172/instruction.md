# Issue

**Title:** Buffer size in initialisation methods

## Description

- The initialisation methods now uses the buffer size in `training_data` for shuffling.
- Cleaned up the initialisation methods in SE-HMM thanks to recent changes in dataset (#171).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b528cc16b93e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.