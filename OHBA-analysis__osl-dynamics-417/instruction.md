# Issue

**Title:** Suggestion to compute eigenvalues of covariance matrix instead of SVD

## Description

Dear osl-dynamics maintainers, I recently tried out osl-dynamics, but found that the PCA and TDE-PCA operations were slower than I would have expected. In my own analyses, I usually use the scipy.sparse.linalg.eigsh function to compute only the eigenvalues of the covariance matrix which are needed, while osl-dynamics currently computes the full SVD of the covariance matrix. If the number of channels is large, I found that this can be quite slow. Thus, I wanted to make the suggestion to use eigsh instead, which I am currently using locally to save computation time.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c00eabcee931`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.