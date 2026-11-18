# Issue

**Title:** Close issue 300 Sampling timestep multiple with outputting cell velocity

## Description

This will close the issue as now the putput step is calculate correctly. 

Note this actually passes all the tests without any changes as the cell velocity was only output at every timestep so I also updated a test to only output evert 12 steps.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `60e837ec54cf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.