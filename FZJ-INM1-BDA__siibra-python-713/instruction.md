# Issue

**Title:** fix: use archive mode for siibra-configuration gitlab repo

## Description

on siibra-api, we are hitting a lot of 429 otherwise.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0f0131ea04db`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.