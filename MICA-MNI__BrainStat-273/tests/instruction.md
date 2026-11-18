# Issue

**Title:** [FIX] Fix mypy errors

## Description

The update to numpy 1.22 has caused a series of mypy errors that look like bugs in numpy's typing. Reverting to numpy 1.21 for the short-term.

List of changes:
- Reorganized Python unit test / lint / mypy files.
- Numpy version for mypy testing now set to 1.21.5

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dff557705d12`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.