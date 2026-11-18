# Issue

**Title:** Fix error in L2 calculation

## Description

The current calculation of L2 norm misses the division by $2$.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `58cdfee03f39`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.