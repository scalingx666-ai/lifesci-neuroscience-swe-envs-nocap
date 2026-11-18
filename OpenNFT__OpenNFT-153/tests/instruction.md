# Issue

**Title:** Fixes: Memmap and Timer resets, OrthView readiness

## Description

CHANGE:

- correct process termination after stop
- stat map projection fix

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cc1a30b6ffa6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.