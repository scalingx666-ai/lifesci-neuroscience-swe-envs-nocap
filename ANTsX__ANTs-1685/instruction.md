# Issue

**Title:** ENH: Retain docker image from PRs

## Description

This will make it easier to quickly download and test PRs, using temporary Github artifacts that expire after 7 days.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4b13b0cca932`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.