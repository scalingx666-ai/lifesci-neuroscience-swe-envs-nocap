# Issue

**Title:** Gymnasium and MSTDP

## Description

1. Deprecate gym, using gymnasium instead 
2. Now a_minus and a_plus can use dict to address a specific layer or individual use the previous definition of one value to all layers. 
3. poetry and black update

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8321825d5824`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.