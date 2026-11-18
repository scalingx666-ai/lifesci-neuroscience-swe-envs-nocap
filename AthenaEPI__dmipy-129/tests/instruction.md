# Issue

**Title:** Fix installation issues with Python >= 3.8

## Description

- Unpinned schipy dependency: Updated the schipy version constraint to allow installation with newer (>=3.8) Python versions.
- Fixed numpy empty array check: Corrected the conditional check for empty arrays in the code to ensure compatibility with newer versions of NumPy (replaced == [] with .size == 0).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `459f77f19864`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.