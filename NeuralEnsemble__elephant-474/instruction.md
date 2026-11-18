# Issue

**Title:** Fix/asset on mac os, add CI workflow for macOS

## Description

This PR is a response to #469 .

**Changes:**
- added 2 GitHub actions runners with macOS 10.15 and macOS-latest
- changed precision in asset to double

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ee5c1906f37f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.