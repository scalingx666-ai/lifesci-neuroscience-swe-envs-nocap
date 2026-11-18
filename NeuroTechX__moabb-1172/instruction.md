# Issue

**Title:** Open the 1.8 development cycle

## Description

Restore the development version after publishing MOABB 1.7.1.

Verification:
- importing `moabb` reports `1.8.0dev0`
- pre-commit hooks pass for `moabb/__init__.py`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3ecde0c3fb64`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.