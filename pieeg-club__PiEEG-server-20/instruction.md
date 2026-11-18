# Issue

**Title:** fix: update Python requirement to 3.10+

## Description

Updates the project’s declared minimum supported Python version from 3.11+ to 3.10+ across packaging metadata and installer/diagnostic checks.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `191434785b38`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.