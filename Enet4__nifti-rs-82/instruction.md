# Issue

**Title:** Slap Travis CI

## Description

I suspect that Travis was using more computational credits than necessary. There were bugs in the file, yet Travis ran the jobs anyway. With #81 in, most of the jobs here don't need to stay in Travis anyway.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5b10f8755325`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.