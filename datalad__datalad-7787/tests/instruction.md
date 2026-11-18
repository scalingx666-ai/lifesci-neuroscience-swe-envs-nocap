# Issue

**Title:** ci: avoid running various test workflows on BOTH PR and branch (unless master and maint)

## Description

I just spotted that we are wasting cycles this way running on a branch (unmerged) version too

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6a79e3e58dec`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.