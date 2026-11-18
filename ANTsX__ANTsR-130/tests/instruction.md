# Issue

**Title:** Updating splitMask

## Description

- updated `splitMask` for faster operation. The old one updated the image itself. The new one updates the vector of voxels and uses it to fill the image at the end.
- added argument voxchunk in `splitMask` to set the number of voxels instead of a pre-computed number of chunks.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ec2aff546b30`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.