# Issue

**Title:** fix: simplification works on larger meshes

## Description

Previously, when pre-existing meshes were provided to the simplifier, they were in physical coordinates and therefore often 30-40x more spaced out than the voxel versions. For very large meshes, this can push them past the limits the packed coordinate representation can tolerate (2^20 for uint64_t). This caused gross corruption in large simplified meshes, the obvious use case.

Now we divide by the voxel resolution before simplifying, which increases the range considerably
<img width="967" alt="image (7)" src="https://user-images.githubusercontent.com/2517065/163513270-dc612b27-f212-4c10-93a2-efc541683e8a.png">
.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `24dc46c8d8d3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.