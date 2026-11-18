# Issue

**Title:** Bug fix on resampleImageToTarget + adding antsImage4DtoList

## Description

Branch includes:
- updated `resampleImageToTarget` to fix [known](https://sourceforge.net/p/advants/discussion/840261/thread/1b3d302b/?limit=25) inaccuracy when image and target have different proportions or fields of view. The updated function relies on `antsApplyTransforms -t identity` to achieve resampling independently of image properties. Took care to keep compatibility with old arguments, in case anybody is using this function. New function can also be applied to 4D, tensor, and other image types.

- added `antsImage4DtoList()` function to allow splitting 4D images into a list of 3D images.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3f4cdf163459`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.