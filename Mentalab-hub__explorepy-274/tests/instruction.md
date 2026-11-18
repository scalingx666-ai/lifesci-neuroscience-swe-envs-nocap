# Issue

**Title:** Improving / Fixing some mock server issues

## Description

- Timestamp indexing when parsing packets in mock server was wrong (only 3 bytes were parsed as timestamp instead of 4)
- Timestamps and PIDs when generating command packets were appended as ints instead of cast to bytes first
- Potentially more issues to be fixed to work with automatic (GUI) testing

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7cc9347ad1f0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.