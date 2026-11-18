# Issue

**Title:** Dev issue 04

## Description

I added a small feature to override the empirical Bayes step whenever a user provides a dataset with a single feature to harmonize. In this case, the EB step would not be applicable.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2a68f4497aba`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.