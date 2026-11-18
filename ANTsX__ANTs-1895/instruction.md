# Issue

**Title:** ENH: Vector reorientation

## Description

Reorient vectors like we do for tensors. 

This composes the local jacobians from the composite transform into one, then does a polar decomposition to get a rotation. Thus it should preserve vector magnitude.

It's up to the user to ensure that the vectors are sensibly interpolated. For axial data, it probably makes sense to use nearest neighbor interpolation. At the least, data should be projected into one hemisphere so that we don't interpolate **x** and -**x**.

I've also added an extra option for displacement vector data in `antsApplyTransforms`. Displacement fields from ITK / ANTs registration are based in physical space. Generic vectors (-e 1) are assumed to be in index space, and are rebased accordingly.

For displacement fields, the vectors are signed and should have some spatial regularity, so linear interpolation might work better.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `193e36eedbdc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.