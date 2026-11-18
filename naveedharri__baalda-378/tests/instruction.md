# Issue

**Title:** Release 0.1.109

## Description

Silent hotfix.
- A file whose folder has not reached the server yet waits for it, instead of being uploaded without a file row, refused, and held back for 24 hours.
- Version 0.1.109 (no release notes).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7838c25be8e9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.