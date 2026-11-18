# Issue

**Title:** Drop the PyPI mock dependency

## Description

This was only needed for Python 2.7, which `nipy` will no longer support ().

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `95fd25cea04c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.