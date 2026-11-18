# Issue

**Title:** Report gantt runtime threads as cores, not percent

## Description

. runtime_threads is taken from cpu_percent, so a node using four cores was charted as 400.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a1f4d6d348b2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.