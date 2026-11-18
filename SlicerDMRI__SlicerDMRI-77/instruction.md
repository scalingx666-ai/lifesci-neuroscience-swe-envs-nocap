# Issue

**Title:** BUG/ENH: use enums for UI<->SeedingNode settings

## Description

- 813704e fixes a UI bug, see the commit message for 415a5f1 for explanation.
- bb8d1a3, 978a147, and efa22a0 re-apply missing/reverted commits from #65 and #66.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `05f033a7518f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.