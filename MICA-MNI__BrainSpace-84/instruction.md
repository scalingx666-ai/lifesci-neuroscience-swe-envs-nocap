# Issue

**Title:** [TST] Add Python 3.11 unit tests

## Description

Currently failing as there's no Python 3.11 wheels for VTK.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `03ffd0e18ca2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.