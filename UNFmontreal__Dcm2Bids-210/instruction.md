# Issue

**Title:** [FIX,ENH] - Improve dcm2bids_helper mod

## Description

- [x] fixed `--force`
- [x] improved overall UX
- [x] added a `--nest` option to enable several helper dir to be created instead of overwrite it.
- [x] Changed `--forceDcm2bids` to `--force_dcm2bids` throughout

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fc78036d9538`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.