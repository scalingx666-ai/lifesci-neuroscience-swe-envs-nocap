# Issue

**Title:** FIX: image indexing returns image where possible

## Description

Previously, indexing an ants image always returned a numpy array. This fix ensures that an ants image is returned where possible. No changes are made to indexing with another ants image or to setting behavior.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7d876d800b3a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.