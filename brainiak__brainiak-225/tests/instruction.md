# Issue

**Title:** dev: Remove Pathos and multiprocess dependencies

## Description

Use multiprocessing instead. Adjust searchlight and fcma to use
pickle-able functions.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2c374c7cef79`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.