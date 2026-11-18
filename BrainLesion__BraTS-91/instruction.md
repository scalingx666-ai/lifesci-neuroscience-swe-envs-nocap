# Issue

**Title:** 89 feature proper logging configuration

## Description

- Remove default stderr logging to leave it up to the user
- Replace sys exits with proper exceptions to provide feedback even wihtout logging output
- Add tests

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `115877a7cdd6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.