# Issue

**Title:** [ENH] return input data if score is negative on first iter

## Description

- retain a copy of the input, which is returned if the mean_score is negative on iteration 0
- removed a couple trailing white spaces
- doesn't alter input data in place
- closes:

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ac12d71e165d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.