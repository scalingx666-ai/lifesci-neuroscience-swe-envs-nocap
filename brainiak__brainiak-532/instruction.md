# Issue

**Title:** Implement release publishing

## Description

This PR implements building of Anaconda and sdist packages for Python 3.8 through 3.10 and uploading to anconda.org and pypi.org on tagged releases. I tried to test the uploading piece as much as possible on my fork but it might need some fixes when it is triggered for the first time.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e0793e144b4f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.