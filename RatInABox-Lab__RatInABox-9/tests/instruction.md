# Issue

**Title:** Fix bug and update arguments in GridCells

## Description

This PR did:
1. Fix the bug when initializing GridCells with `"random_gridscales": False`.
2. Make non-random phase_offsets for GridCells.
    The offsets separate into two parts. One is organized, and the other is random.
    (e.g. if n=101, then 100 cells have organized phase offsets, and the last 1 cell's phase offset is random.)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2caf564ac956`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.