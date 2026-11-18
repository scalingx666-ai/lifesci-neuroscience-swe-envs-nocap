# Issue

**Title:** Bump version + fix sklearn/pyriemann compat

## Description

Pyriemann doesn't seem to be maintained anymore, so we have to point to a specific PR that adresses compatibility fixes with scikit-learn>=0.24

cf.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aed858dc3603`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.