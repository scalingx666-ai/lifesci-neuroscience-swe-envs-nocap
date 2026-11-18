# Issue

**Title:** Improved docs for stats testing

## Description

Closes 

Changes:
- Improved documentation for stats testing functions and the GLM.
- Fixed warnings building the docs.

Note, covariates are automatically standardised in the GLM via the default keyword argument in
```
DesignConfig(..., standardize_features=True)
```
This is now stated in the docs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1bc2c5dbbf8e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.