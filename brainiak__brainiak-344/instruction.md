# Issue

**Title:** modify ISFC

## Description

1. modify p_from_null to take a bool parameter "memory_saving"
2. modify ISFC so that the voxel-by-voxel-by-subject array generated during each iteration of num_perm is not stored anymore. ISFC should always use the memory_saving mode of p_from_null

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fe604afbf1b9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.