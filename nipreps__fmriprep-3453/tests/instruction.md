# Issue

**Title:** fix(resampling): Use nearest mode for extrapolating data outside image boundaries

## Description

This PR addresses an interpolation effect when the brain signal goes right up to the edge of the image.

We have used the [scipy.ndimage.map_coordinates](https://docs.scipy.org/doc/scipy/reference/generated/scipy.ndimage.map_coordinates.html) default interpolation mode of `"constant"`, which extends the input image with zeros when necessary to perform interpolation (within two voxels of the edge, for the cubic interpolation we do). This will frequently result in zeroed-out portions of edge voxels.

This generally works well when the image field of view is large enough to fully contain the brain, but can cause problems for limited field-of-view scans or images where the brain tissue can be found in the edge voxels.

By switching to `nearest`, the edge voxels are extended out. For images with plenty of space around the head, this should have very little impact. When brain tissue extends to the image boundary, this should avoid inducing a signal drop-off.

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `745f93ba2e48`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.