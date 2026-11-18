# Issue

**Title:** MRG, MAINT: Simpler vector params

## Description

We can avoid a lot of gymnastics having to do with maximum magnitudes and even scalars by setting the `scale_mode='vector'` in the `quiver3d` call.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b0ca3a15b4c3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.