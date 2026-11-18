# Issue

**Title:** MAINT: Update lefthook config

## Description

We should be operating in stages instead of all in parallel. Some can still be in parallel when they operate on distinct sets of files.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `687e4d31c509`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.