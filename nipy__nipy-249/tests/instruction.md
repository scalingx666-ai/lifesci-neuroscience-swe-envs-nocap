# Issue

**Title:** BF: Fix bug in multiple_fast_inv

## Description

Some computations were done outside the loop, but they depend on values changing at each iteration. This resulted in wrong inverse values because of the use of the wrong `piv` variable. Also the check of `info` was done only for the last decomposition.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a2489516ac59`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.