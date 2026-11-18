# Issue

**Title:** [bugfix] Voxeliztion missing arg

## Description

Voxelization in the comparison workflow was missing an argument. The single workflow has the right arg there, but not the comparison workflow.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d9cdb155f08f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.