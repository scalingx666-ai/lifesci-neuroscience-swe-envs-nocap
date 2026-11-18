# Issue

**Title:** chore: Drop Python 3.9 support, advertise 3.14

## Description

Python 3.11 is now out of SPEC0 support. Also bumps minimum dependencies in accordance with #803.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ad45d623bf23`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.