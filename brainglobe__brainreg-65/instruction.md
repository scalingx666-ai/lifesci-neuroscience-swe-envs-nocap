# Issue

**Title:** Tidy up pre-commit config and CI

## Description

Fixes pre-commit. Note that tests were broken before this, and can be fixed in another PR.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `59c1da6e587a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.