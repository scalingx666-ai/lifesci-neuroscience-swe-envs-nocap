# Issue

**Title:** Update Python versions to adhere to SPEC 0 and remove Intel testing on macOS

## Description

I also standardised the CI config a bit.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d0e8f58f00e4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.