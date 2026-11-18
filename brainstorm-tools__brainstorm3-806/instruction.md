# Issue

**Title:** Corr with flat signals

## Description

This PR updates the code in `bst_corrn` to allow to return `NaN` if correlation is computed with flat signals. This is inline with the Matlab function `corr`

It also updates `bst_connectiity` to be able to save `NaN` in the connectivity matrix.

This addresses the issue reported in #774

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c8b8f15c75ac`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.