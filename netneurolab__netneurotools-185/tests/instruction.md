# Issue

**Title:** [REF] Refactor `mean_first_passage_time`

## Description

This PR refactors `metric.bct.mean_first_passage_time`. Since a recent release of numpy ([2.5.0](https://github.com/numpy/numpy/releases/tag/v2.5.0#:~:text=linalg.eig%20and%20linalg.eigvals%20now%20always%20return%20complex%20arrays)), `np.linalg.eig` always returns complex arrays.

We chose to change our algorithm altogether: rather than calculating the stationary distribution with `np.linalg.eig`, we now use `np.linalg.solve`. It is much faster and avoids potential issues associated with complex values or periodic Markov chains.

We also added a check to ensure that the matrix is strongly connected (otherwise is it not irreducible).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9d93223603f7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.