# Issue

**Title:** chore(ci): Cache npm packages

## Description

Installation can sometimes be slow and occasionally get a 429 Too Many Requests. A cache should help both things.

Bumping node to 22.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8417d0645e6e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.