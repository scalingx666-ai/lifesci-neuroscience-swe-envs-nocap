# Issue

**Title:** [math] fix `brainpy.math.scan`

## Description

Fix the different behavior of ``scan`` with and without jit decorator.  #602

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8c57f66c9fff`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.