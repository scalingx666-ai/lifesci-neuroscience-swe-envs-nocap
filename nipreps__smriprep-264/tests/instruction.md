# Issue

**Title:** FIX: Revert to FAST for tissue probability maps

## Description

Backport of #263 to 0.7.x.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `80f0c804fa9b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.