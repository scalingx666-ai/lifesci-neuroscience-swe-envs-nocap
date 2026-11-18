# Issue

**Title:** open readme only once in setup.py

## Description

The ../README.md call in version.py on one side was granting the long
description to be properly defined in the setup process, but on the
other it was making `import dmipy` crash.

To solve the problem, the opening of the file is moved to setup.py

This allows to pack everything for PyPi.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `60c383ecc3f3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.