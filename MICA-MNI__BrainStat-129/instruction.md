# Issue

**Title:** [FIX] CI now works on forks

## Description

This PR fixes CI on forks. Formerly, these would be unable to load the test-data.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d03bf35e5e13`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.