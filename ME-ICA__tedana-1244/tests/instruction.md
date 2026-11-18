# Issue

**Title:** Fix NaNs in external regressors, take 2

## Description

Turns out  did not fix the issue, because the modified dataframe is never returned to the workflow.

Quick fix, but adding tests would be better.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `de27c550f9e5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.