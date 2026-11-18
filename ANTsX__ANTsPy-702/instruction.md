# Issue

**Title:** COMP: downgrade numpy for arm64

## Description

Latest numpy and statsmodels don't play nicely together. Have to downgrade one or the other for now

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f2f1571fb58b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.