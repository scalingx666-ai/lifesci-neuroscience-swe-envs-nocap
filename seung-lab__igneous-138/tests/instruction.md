# Issue

**Title:** fix: use factor arg within create_transfer_tasks

## Description

`create_transfer_tasks` currently doesn't pass its `factor` kwarg to `create_downsample_scales` which assumes `factor=(2, 2, 1)`. If the user wants a different downsampling factor this results in inconsistent downsampled layers.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f63164e29787`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.