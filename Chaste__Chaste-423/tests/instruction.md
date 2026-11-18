# Issue

**Title:** 266 fix cvode 7

## Description

Change to make Chaste work with CVODE 7.1.1

Also needs a container for the CI.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8eb7e01b901e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.