# Issue

**Title:** Fixes for HIVE

## Description

Changes:
- Fixed error when running HIVE on BMRC.
- Fix issue in config API where you had to save and load the model.
- Save regulariser parameters in the model config.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `613280693624`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.