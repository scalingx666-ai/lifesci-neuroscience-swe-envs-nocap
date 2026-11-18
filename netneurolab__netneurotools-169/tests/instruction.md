# Issue

**Title:** [FIX] Refactor `find_consensus` function

## Description

This commit refactors the `find_consensus` function by removing the `bct.clustering.agreement` dependency, which broke after numpy's latest update. It introduces a new and improved implementation of `bct.clustering.agreement` called `agreement_matrix`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `14de0092022a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.