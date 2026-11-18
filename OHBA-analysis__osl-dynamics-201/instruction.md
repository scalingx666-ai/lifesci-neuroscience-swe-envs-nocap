# Issue

**Title:** Refactored dual estimation for HMM and wrapper to train SE-HMM.

## Description

Changes:

- Introduced for loops that loop through states in dual estimation for HMM. This significantly reduces memory consumption while maintaining good speed.
- Improved initialisation of SE-HMM. Now subject embeddings are initialised by PCA'ed dual estimated covariances from a pre-trained HMM.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ea7c97b02484`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.