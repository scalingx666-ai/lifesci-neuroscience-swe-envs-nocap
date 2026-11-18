# Issue

**Title:** BUG: Cache key had wrong path to config scripts

## Description

Needs to invalidate cache if configure scripts change (often implies ITK / ANTs bump)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6018c8be5d22`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.