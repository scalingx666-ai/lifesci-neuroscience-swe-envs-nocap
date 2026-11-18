# Issue

**Title:** Remove dynamic lib build by default

## Description

Disabling ExploreSDK build by default. 

This means:

1. We need to proovide a default python version for linux and windows.
2. Put documentation in README aboout building from source.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c0ead916ac74`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.