# Issue

**Title:** MRG: Deprecate several functions (from nipy.labs and nipy.algorithms)

## Description

This PR deprecates some stuff that is seemingly not used and/or available with a better implementation elsewhere.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5ff3525fdadc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.