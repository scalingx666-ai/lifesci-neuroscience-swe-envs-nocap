# Issue

**Title:** [Maintenance] access test-data cache from PR

## Description

for PRs: access the test-data from cache without incurring data transfers from the rate limited test-data repository

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c2474456303a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.