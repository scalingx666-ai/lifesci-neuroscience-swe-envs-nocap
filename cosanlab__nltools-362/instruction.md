# Issue

**Title:** pin minimum python version in setup.py

## Description

Added `python_requires` field with a min version of 3.6.  At least one pinned dependency version has dropped support for `python<3.6` (#361), and it looks like the travis tests for 2.7 were removed in April 2019.  Also updated the PyPI classifiers to reflect the versions officially supported.  

One test in one job failed on my fork (I think because `SimulateGrid._create_noise()` managed to add more noise than the test will accept?) but it looks like that's been happening on master too.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `91822a457784`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.