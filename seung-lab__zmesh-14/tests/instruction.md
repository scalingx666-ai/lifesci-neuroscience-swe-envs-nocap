# Issue

**Title:** fix: remove int restrictions from voxel_resolution

## Description

Simplifier handles floats just fine

Also modified the test mesh generator to use floating point voxel resolution + ensure a call to the simplifier

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1723e1c6c7bf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.