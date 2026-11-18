# Issue

**Title:** Clean-up via static analysis performed by codetools package

## Description

`checkUsagePackage('nat')` threw up a few things that could be removed, plus one in `cmtkparams2affmat()` that cannot.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `926d2e381958`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.