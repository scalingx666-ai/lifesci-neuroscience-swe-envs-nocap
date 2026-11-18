# Issue

**Title:** COMP: don't use latest scipy

## Description

statsmodels needs scipy < 1.16 for now. This will be fixed later

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `48f3ecbd26f9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.