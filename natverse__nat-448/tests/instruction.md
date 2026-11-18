# Issue

**Title:** Improve reading of Simple Neurite Tracer fills

## Description

While this provides basic support for reading fills, it is only at the level of 3D coordinates for each positive voxel.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e9d8b4927833`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.