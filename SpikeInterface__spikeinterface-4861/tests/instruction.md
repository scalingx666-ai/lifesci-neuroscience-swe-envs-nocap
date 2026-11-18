# Issue

**Title:** Fix: PCA computation in lazy mode

## Description

Even in lazy mode, we should be able to compute PCA, but this is currently not possible!

Also, `get_pca_model` now only fails if they cannot be found in the `self.data`: if one computes PCA in lazy mode and retrieves the model in the same session, then they are correctly loaded and available

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fd5d42312420`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.