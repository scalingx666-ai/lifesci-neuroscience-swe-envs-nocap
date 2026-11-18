# Issue

**Title:** Jacob/max sub update

## Description

Updates default behavior of clustering step to use `nskip = 1` and `max_cluster_subset = 25000`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8d2b46d36c32`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.