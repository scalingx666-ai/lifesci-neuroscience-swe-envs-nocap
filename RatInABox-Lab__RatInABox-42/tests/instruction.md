# Issue

**Title:** Made collect_all_params more flexible

## Description

`collect_all_default_params` changed to `collect_all_params` to allow the function to be used with user-defined class dictionaries.
Fixed the None return following the warning if the params dictionary doesn't exist.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9693b892911b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.