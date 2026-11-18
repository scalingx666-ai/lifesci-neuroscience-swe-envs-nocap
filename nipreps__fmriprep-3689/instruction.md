# Issue

**Title:** fix: avoid config overwrites during workflow build

## Description

process level configuration should not be altered within individual processing group runs

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `40a723c135fd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.