# Issue

**Title:** perf: faster somas

## Description

Uses the new hybrid euclidean distance field implementation to process large areas of the DAF for somata rapidly.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `717beae52431`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.