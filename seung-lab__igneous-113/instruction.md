# Issue

**Title:** fix: Add kwarg for updated get_bounds

## Description

This fixes `get_bounds` calls that rely on positional arguments that I broke in PR #108.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `553810199062`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.