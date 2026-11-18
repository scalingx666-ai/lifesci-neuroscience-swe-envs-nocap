# Issue

**Title:** fix volume dataset

## Description

Modified connectomics/data/dataset/dataset_volume.py to not throw error when valid_mask is None

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6fc443548457`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.