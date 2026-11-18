# Issue

**Title:** Allowing the `sl_rad` parameter in searchlight to be 0

## Description

There are use cases in which we want to do the same processing on all voxels and want to use MPI to parallelize this. In this case, the searchlight has the size of 1, and it corresponds to `sl_rad = 0` when initializing `SearchLight`. But the current implementation will distribute an empty array to each worker if we set `sl_rad = 0`. The consequence is that nothing gets computed for each voxel. This PR fixes this bug.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e49b1218cd37`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.