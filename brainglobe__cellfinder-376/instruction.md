# Issue

**Title:** Searching for min. segfault example

## Description

# DO NOT MERGE!

At present, #372 seems to be only replicable on GH runners, so creating this branch with a more focused CI workflow to attempt to distil a minimum failing example.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `448170bc9f76`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.