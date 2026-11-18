# Issue

**Title:** bug fix for extra_reg check, fixes #67

## Description

Ok, I managed to work on a PR to fix the issue with the extra_regressors option. 

I will try and find some time to work on optional resuming if results output exist for type A, B, C etc. but this might take some time.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5b3a6ebd4db7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.