# Issue

**Title:** Fix some refresh issues

## Description

1. Refreshes the "Back-End File System" in case an Experience was created (in the Experience-Wizard) for the same user that is currently already shown in the "Back-End File System".

2. Fixes a refresh problem in "Experience Selection" which was using a cached response.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `975d0daa5f5f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.