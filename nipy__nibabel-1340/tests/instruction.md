# Issue

**Title:** Bunch of multiframe fixes

## Description

This fixes a bunch of issues with multiframe DICOM.

Instead of assuming the slice index is correct for ordering slices along the normal direction, I compute the slice location from the ImagePositionPatient for each frame and use that.  This avoids slice orientation flips. I also use the ImagePositionPatient value with the minimum slice location as the `image_position` property, instead of just using the one from the first frame.

Any DimensionIndexValues that don't help to sort the data are ignored, and at the end (if needed) we try combine these into a single tuple index. This approach allows the code to work with a number of real world data sets that previously caused errors.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5d10c5b8bb09`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.