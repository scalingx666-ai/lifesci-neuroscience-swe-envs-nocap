# Issue

**Title:** Dev

## Description

Tuning and fixes for oscillation finding. 

NOTE: This update changes API - input is now frees & psd, both linear (no longer takes logged power vals as input).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ae1781598801`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.