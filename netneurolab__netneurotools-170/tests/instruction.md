# Issue

**Title:** [REF] Refactor `find_consensus` function

## Description

This commit refactors the `find_consensus` function by removing the `bct.clustering.consensus_und` dependency, which broke after numpy's latest update. It introduces a new and improved implementation of `bct.clustering.consensus_und` called `consensus_clustering`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bdf6025c4ccf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.