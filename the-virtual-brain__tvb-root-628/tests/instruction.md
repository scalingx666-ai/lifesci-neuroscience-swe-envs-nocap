# Issue

**Title:** TVB-3054: Fix description not being saved

## Description

- make max_operation_size field in project properties page readonly for members instead of disabled (being disabled prevented saving description changes by members-only)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `59609f503444`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.