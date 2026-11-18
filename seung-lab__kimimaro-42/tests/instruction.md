# Issue

**Title:** fix: 64-bit addressable _roll_invalidation_cube

## Description

Roll invalidation cube was breaking on huge arrays.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e06bb367960b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.