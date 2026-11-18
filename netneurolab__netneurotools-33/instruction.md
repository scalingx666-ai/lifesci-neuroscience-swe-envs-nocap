# Issue

**Title:** [REF] Reduce required dependencies

## Description

Remove `pandas`, `requests`, and `seaborn` as requirements throughout package and modify all content to avoid using them.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6448c795ed24`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.