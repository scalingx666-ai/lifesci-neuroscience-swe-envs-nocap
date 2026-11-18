# Issue

**Title:** changed behavior of code around somas

## Description

skipped to root node when path gets within soma_distance. Also prevented invalidation ball from running on root node.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `35012d5de197`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.