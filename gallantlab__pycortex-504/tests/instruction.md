# Issue

**Title:** FIX Improve masks returned by `get_roi_masks` and correctly split into left/right hemispheres

## Description

When loading an ROI mask or a set of vertices within an ROI, the code previously returned only vertices on the flatmap. This is fine in general, but if the ROI spans a cut, then those vertices won't be included and the ROI mask will ignore some voxels.

This PR fixes this issue by including the neighboring vertices that are not present in the flatmap.

## Example: before/after for `get_roi_verts`.

**Before**
<img width="400" alt="verts_before" src="https://github.com/gallantlab/pycortex/assets/6150554/61e189ec-89f2-42a1-8063-9166b39b2541">

**After**
<img width="400" alt="verts_after" src="https://github.com/gallantlab/pycortex/assets/6150554/0e1451e6-5958-4f12-8dc2-6d50686fae7e">

## Example: before/after for `get_roi_masks`.

**Before**
<img width="400" alt="mask_before" src="https://github.com/gallantlab/pycortex/assets/6150554/094aa796-3db3-436b-8058-4593a97c7dcf">

**After**
<img width="400" alt="mask_after" src="https://github.com/gallantlab/pycortex/assets/6150554/4200a889-688e-47fa-9f16-5aff6ed874b1">

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1e69525f26d2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.