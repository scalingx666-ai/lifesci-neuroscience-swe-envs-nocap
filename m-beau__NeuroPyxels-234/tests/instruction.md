# Issue

**Title:** Minor fixes to 3D ACGs

## Description

Update 3D acgs to center inverse ISI method on the current spike - resulting in nearly symmetric ACGs. Also changed how quantile binning is done to ensure consistency with Julia code

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `67c3728754c2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.