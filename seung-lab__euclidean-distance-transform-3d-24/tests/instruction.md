# Issue

**Title:** fix: try using long int instead of int in key locations

## Description

Trying to fix seg fault on huge arrays.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f9d35cca648d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.