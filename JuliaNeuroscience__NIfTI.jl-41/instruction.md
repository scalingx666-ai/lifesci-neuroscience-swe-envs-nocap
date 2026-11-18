# Issue

**Title:** Fix Project files

## Description

I completely forgot to check dependencies on the last PR. This also sets the test dependencies more appropriately.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `099684c76b2d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.