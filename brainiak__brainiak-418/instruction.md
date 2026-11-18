# Issue

**Title:** dev: Drop support for Python 3.4, add 3.6 testing

## Description

Mypy dropped support for Python 3.4 in version 0.700. Technically, we
could separate the Python version in developer requirements from the
Python version in user requirements (where Mypy is not a dependency),
but I think that would complicate our setup too much.

Also switch to Ubuntu 16.04 for Travis testing, since support for 14.04
ends in April 2019.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c2df4a131cb1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.