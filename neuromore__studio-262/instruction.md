# Issue

**Title:** Cleanup PRODUCTION_BUILD macro usage

## Description

Removes some limitations in production builds:

* Allow user to properly switch cloud backend

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `193bda41badf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.