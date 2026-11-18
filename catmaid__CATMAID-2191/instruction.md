# Issue

**Title:** Stack mirror export/import fixes

## Description

- Project import: do not append trailing slash to mirror URL
- Project export: include all mirrors for stack

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f18919fad60f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.