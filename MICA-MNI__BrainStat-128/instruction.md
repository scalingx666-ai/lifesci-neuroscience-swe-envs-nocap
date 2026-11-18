# Issue

**Title:** [FIX] CI now works on forks

## Description

Currently, the test-data branch is inaccessible on forks during CI. This change to the .yml files resolves that issue.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d333af04ed37`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.