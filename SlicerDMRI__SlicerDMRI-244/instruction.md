# Issue

**Title:** BUG: fix fiber subsampling

## Description

Several logic errors caused a pipeline loop and
the naming of variables was confusing.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `02ff0fc30f24`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.