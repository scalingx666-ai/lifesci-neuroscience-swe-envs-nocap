# Issue

**Title:** [MAIN] add Python 3.12

## Description

This pull request introduces support for Python 3.12, which was  released as of October 2, 2023.

Python 3.12 release, see: <https://www.python.org/downloads/release/python-3120/>

# Changes
- add Python 3.12 to CI workflow. 
- update ci-buildwheels to create wheels for python 3.12

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e2df1b96a4d8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.