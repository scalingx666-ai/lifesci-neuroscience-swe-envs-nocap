# Issue

**Title:** Python 3.9

## Description

I suspect these tests will fail or take forever as some dependencies won't have wheels available for 3.9, but it's good to have the PR available.

Also skips the pypy-specific setup script for non-pypy builds.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `70159c8a6831`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.