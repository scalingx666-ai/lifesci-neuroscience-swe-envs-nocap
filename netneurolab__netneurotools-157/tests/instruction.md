# Issue

**Title:** [REF] Make _morans_i_vectorized much faster

## Description

This PR makes the `_morans_i_vectorized` function much faster by using `@` instead of `np.outer`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `847b3e8f3ef7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.