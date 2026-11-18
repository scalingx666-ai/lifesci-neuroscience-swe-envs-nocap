# Issue

**Title:** [fix] change input type to float

## Description

since the weights of the model is float, we needed to have the same dtype.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0a36143e298b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.