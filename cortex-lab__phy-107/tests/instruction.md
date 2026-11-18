# Issue

**Title:** Wizard

## Description

- Wizard class with best clusters and most similar clusters.
- The functions to compute the cluster quality and the cluster similarity are provided explicitely.
- The interactive logic will be in the ClusterView's JavaScript.
- Refactored cluster metadata and cluster stats,
-

To do later:
- Filtering the most similar clusters as a function of the cluster groups
- Mark skipped candidates and discard them in the list of most similar clusters

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fd374625c29c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.