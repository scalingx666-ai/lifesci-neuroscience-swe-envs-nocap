# Issue

**Title:** Fix issue with leaking connections when downloading remote neurons

## Description

This is not a particularly satisfactory solution, but it does seem to work.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c811d9cabd62`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.