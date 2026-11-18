# Issue

**Title:** Atropos MRF performance improvements

## Description

The MRF evaluation relies on a lot of neighborhood quantities that can be computed more efficiently, such as the distance between neighboring voxels.

Instead of doing a nested for loop

for all labels in classes
   for all voxels in neighborhood

A single loop over all voxels in the neighborhood can sum up the distance weightings of voxels sharing each class, which can then be multiplied by the appropriate deltas.

This prevents computation time from blowing up so much when MRF neighborhood is > 1. It still takes longer, but it's about 50% faster with MRF radius 2x2x2.

This is backwards compatible with the existing implementation with the default ants cortical thickness parameters.

I did notice some differences on edge voxels when using partial volume classes. GPT suggests this is because ties are more likely because of the delta formulation: -2 (same label), -1 (common partial volume label) +1 (other labels). The combination of -2, -1, and +1 deltas could almost cancel out, leading to a dependency on small deltas from not doing the multiplication inside the nested loop.

This seems plausible to me. Without partial volume classes, the results are identical so I think the math is correct.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0e979efe659e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.