# Issue

**Title:** Test scripts

## Description

We weren't testing the scripts.  When I added some tests, I realized that there were a little broken, and that they were completely broken on windows.   Try and fix this.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5eecbabc9dae`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.