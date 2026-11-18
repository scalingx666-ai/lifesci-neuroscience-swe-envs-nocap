# Issue

**Title:** ENH: Discover scripts automatically

## Description

Discover scripts automatically.
- Fixes some scripts having been missed when listing them manually.
- Add the scripts in the `utilities` folder.
- Do not add the `testing/test_run.py` test script for now as it is
  known to fail due to the testing data not being available.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `27662020a62f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.