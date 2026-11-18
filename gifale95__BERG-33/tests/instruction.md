# Issue

**Title:** Development

## Description

Error with Huze Model on CUDA:
Ales error appeared at code line
`part2_global_map = all_indices[~torch.isin(all_indices, part1_voxel_indices_tensor)]`

If self.part1_voxel_indices is None, there could be a device mismatch.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bf12ec1bf8bc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.