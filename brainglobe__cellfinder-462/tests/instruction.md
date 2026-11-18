# Issue

**Title:** Pin `keras` version to 3.5.0

## Description

Currently, training enters an infinite loop at the end of an epoch.

This only happens with `keras==3.6.0`. Temporarily pinning to `3.5.0`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `594b5c0e133b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.