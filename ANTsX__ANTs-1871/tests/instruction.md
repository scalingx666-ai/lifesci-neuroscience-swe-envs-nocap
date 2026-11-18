# Issue

**Title:** BUG: Fix tensor reorientation with displacement fields

## Description

There was a lot of unused code in the PPD filter, and it was not consistent about how it expected the input tensors to be based - it seems it corrected for the header orientation with affine transforms, but not with displacement fields. A comment suggested this was intentional, but it produces wrong results if the resampled tensor image does not have an identity header transform. 

I've simplified the code in this PR.

Tensors should be stored in voxel orientation. In antsApplyTransforms, they are reoriented correctly into the voxel orientation of the reference space (#678).  In the new PPD filter, the tensors are rebased into physical orientation, the rotation from the transform is applied, then they are rebased onto the voxel orientation.

My motivation for getting back into this issue is the forthcoming BIDS extension proposal for dMRI derivatives. I plan to eventually do all the reorientation in `antsApplyTransforms`, but first I wanted to get the existing workflow correct. 

There remains the issue of how to import / export FSL tensors, these will require special handling, partly because of different NIFTI storage conventions, but also the tensor orientation in FSL has an x-axis flip compared to the ITK direction matrix, if the header transform has a positive determinant. This will require some special handling on input.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `15bb85c7dcb3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.