# Issue

**Title:** Fix: speed up loading (and compute sparse PCA projections) in lazy mode

## Description

3 fixes:

- PCA models (objects) are skipped when loading extensions
- Materialize valid unit periods for fast and repeaded access
- Materialize PC array if `get_some_projections`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `80aa6436dfc2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.