# Issue

**Title:** Add battery stats

## Description

Added tracking for the following battery statistics:
- Percentage (tested)
- Voltage (still needs testing - this PR will be a draft until we test this on our side)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ee7d056ebd40`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.