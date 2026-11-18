# Issue

**Title:** in ci slack notifications, use slack user ids to fix user mentions

## Description

This script was still relying on legacy slack usernames. This worked for old accounts, but not for all relevant. These IDs work for everyone.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4a3065e7e04e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.