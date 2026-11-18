# Issue

**Title:** MNT: Unpin libitk 5.3 (ANTs 2.5.3 is built with 5.4)

## Description

Getting whiplash here.

Spent way too long today trying to fix this upstream:

* 
*

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d2f89b92ecc1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.