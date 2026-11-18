# Issue

**Title:** Add support for UKBB pretraining

## Description

- Update ukbb-flat dataset generation.
  - use remote r2 storage
  - more error handling for missing data
- Add support for downloading remote clips datasets on hf/r2/s3. (But note, downloading from hf results in 429, too many requests.)
- Make data loading more robust to s3 errors with `warn_and_continue` handler
- Fix inf values in metric logger
- Add example scripts for running batch jobs on lightning

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b3d97ca3b5bd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.