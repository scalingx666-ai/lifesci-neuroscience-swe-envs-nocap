# Issue

**Title:** Clean up package dependencies

## Description

I noticed while putting `brainreg` on conda-forge that there's quite a few dependencies that don't seem to be needed. I've removed some that don't seem to be used, and cleaned up the remaining list in alphabetical order.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3c75d0261b48`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.