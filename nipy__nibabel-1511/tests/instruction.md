# Issue

**Title:** chore: Add Python 3.15 and Linux ARM to pre-release matrix

## Description

3.15 is not expected to install yet, since even numpy doesn't have wheels, so we won't merge until that's set.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `47055763e7cd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.