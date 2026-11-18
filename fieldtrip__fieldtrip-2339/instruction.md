# Issue

**Title:** do not recompute lf if already existing

## Description

this relates to the issue #2188 
after the dipole scan, the leadfield should be recomputed only if not already existing

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b0bd8aaa710b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.