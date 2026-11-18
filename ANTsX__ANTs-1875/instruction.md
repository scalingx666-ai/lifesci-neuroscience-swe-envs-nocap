# Issue

**Title:** Dt background value

## Description

We've had a default tensor pixel value for some time, but it's only used when the fixed and moving domains don't overlap. 

A bigger problem is that when the tensor volume is brain masked, the interpolation with zeros in the log space causes huge tensors at the edge of the brain, which hinders visualization of tensor glyphs or mean diffusivity images.

Currently, this can be avoided with the `TensorMask` option in `ImageMath`.

This PR allows the use of a default isotropic tensor in background voxels. In antsApplyTransforms, the default mean diffusivity specified with `-f` is now used in background voxels of the moving image, so that resampling is more sensible along the edge of the brain.

The default value of -f remains zero, so the user has to opt-in to using the new functionality.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8351e3c06492`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.