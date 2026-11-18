# Issue

**Title:** chore: Update minimum dependencies, test with tox-uv

## Description

This is narrowly targeted to get tests passing.

Python 3.13 support depends on a new release of sdcflows. Will work on that today.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3e7763816b8c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.