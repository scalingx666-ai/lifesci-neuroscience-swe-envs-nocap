# Issue

**Title:** Fixes default classifier error with regression tests

## Description

This PR addresses #476: 

- Adds module-specific fixture that copies the user's current classifier (if it exists) to a temporary directory, then copies over suite2p's default classifier to `.suite2p`. It then moves back the user's classifier to `.suite2p` during the teardown step of the test.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `562b1ce9d145`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.