# Issue

**Title:** Bump remaining MacOS instances from 13 to 15

## Description

This was supposed to go with #3596, but my regex was not as thorough as I expected it to be.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a15e4fe5e84e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.