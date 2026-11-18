# Issue

**Title:** [FIX] Fix save_mapping and load_mapping utils

## Description

, . `save_mapping`  now dumps the weights on the cpu before saving and the user has the choice to pass a device when using `load_mapping`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e0170f7195ad`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.