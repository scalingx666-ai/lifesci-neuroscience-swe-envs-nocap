# Issue

**Title:** Faster pre-commit stage

## Description

No need to install dependencies for pre-commit, it runs tools in their own environment.  Together with caching, this step goes down from 1m30 to 11s. Not a major issue, but since this step blocks the following steps, every little improvement helps.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `83aa4d17b5df`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.