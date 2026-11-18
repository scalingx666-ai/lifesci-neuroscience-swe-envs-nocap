# Issue

**Title:** fix(server): Extend browser cookie lifetime to 7 days

## Description

Fix an issue where login cookies would expire early and logout users more frequently than intended.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ab2722ef2120`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.