# Issue

**Title:** Multiple embeddings

## Description

This PR makes the following changes:

- Reformulated the way the KL term associated with deviation magnitude contributes in the loss.
- Added feature so that HIVE and DIVE allow for hierarchical embedding structure, i.e. multiple session labels can be passed.
- Force embedding vectors to have unit norm.
- Fixed the HIVE wrapper.
- Avoid unnecessary shuffling during `random_subset_initialization`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f3e990fe4747`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.