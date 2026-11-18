# Issue

**Title:** Optimizations for finding decision points on sparse volumes

## Description

Optimizations for finding decision points on sparse volumes
- If the number of voxels is below a certain threshold do not count it as a segment to expand.
- If number of unique segments in a subvolume is <2 do not expand.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dccf620f540c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.