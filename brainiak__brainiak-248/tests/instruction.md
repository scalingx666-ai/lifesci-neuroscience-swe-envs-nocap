# Issue

**Title:** docs: Add release notes

## Description

We use Towncrier to manage release notes (used by Pip, Pytest, Twisted,
etc.):
https://github.com/hawkowl/towncrier

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `25b0c831fa18`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.