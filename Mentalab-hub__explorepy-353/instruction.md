# Issue

**Title:** Apis 1222 fix conda ubuntu

## Description

Simply replaces the conda setup workflow for Ubuntu with the same steps we use for macOS.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `074df46ef457`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.