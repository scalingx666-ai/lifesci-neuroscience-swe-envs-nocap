# Issue

**Title:** [MAINT] Fix tests

## Description

CCA tests are failing in #52 

I can't reproduce it locally so I suspect it's due to random number configuration

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `48f15344367f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.