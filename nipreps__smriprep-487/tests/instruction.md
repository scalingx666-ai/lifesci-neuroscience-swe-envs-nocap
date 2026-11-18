# Issue

**Title:** FIX: Create copy of query before modifying

## Description

.

Changes proposed:

- Create copy of transform queries before updating them. These are the only queries in `collect_derivatives` that are used repeatedly, so they're the only ones we should need a copy of.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `29f0def0c5aa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.