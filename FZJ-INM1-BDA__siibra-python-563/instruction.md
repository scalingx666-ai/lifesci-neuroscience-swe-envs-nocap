# Issue

**Title:** fix: write lock for warmup

## Description

Since warmup writes files, it is potentially possible to have multiple process trying to warmup simultaneously. 

This PR prevents simultaneous write by using a FileLock (or SoftFileLock in windows).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `af3908801060`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.