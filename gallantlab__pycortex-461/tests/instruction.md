# Issue

**Title:** FIX force vmin/vmax to 0/1 whenever an array is passed as alpha

## Description

This should lead to a more intuitive behavior when passing an array as alpha to both `VolumeRGB` and `VertexRGB` objects.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `067a5c3c8d4c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.