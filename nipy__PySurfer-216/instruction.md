# Issue

**Title:** MRG: Check limit monotonicity

## Description

A small tweak to ensure we check that `fmin < fmid < fmax`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2fe06fab165d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.