# Issue

**Title:** moved computedelaymatrix function to /utils/model_utils

## Description

computeDelayMatrix is the same for aln, fhn, hopf, wc, ww model
moved function to model_utils.py to avoid code duplication

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `846c3f7925fa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.