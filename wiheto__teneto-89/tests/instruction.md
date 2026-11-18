# Issue

**Title:** fix to deprecated function call

## Description

Call to 'distance.matching' in utils.py is changed to 'distance.hamming', as 'distance.matching' was removed from scipy in version 1.9.0 and 'distance.matching' was just an alias of 'distance.hamming'.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c45ca8782a38`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.