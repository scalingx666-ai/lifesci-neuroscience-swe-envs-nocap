# Issue

**Title:** fix: crop NIfTI VOI in voxel coordinates without rescaling

## Description

**Title:** fix: correct NIfTI VOI cropping

### Summary
- Fix `NiftiProvider.fetch(voi=...)` for voxel sizes other than 1 mm, fractional VOI bounds and 4D images.
- Clip the VOI to the image extent, and raise for a VOI that does not overlap the image.

### Changes
- `siibra/volumes/providers/nifti.py`:
  - `_snap_to_grid` (new): rounds voxel coordinates within 1e-6 of an integer, so VOI bounds on voxel boundaries don't add a voxel.
  - `NiftiProvider.fetch`:
    - Round the VOI outward in voxel coordinates directly. Previously the voxel coordinates were divided by the voxel size a second time, which gave a wrong crop for images whose voxels aren't 1 mm.
    - Shift the affine to the first voxel of the crop. Previously the unrounded VOI start was used.
    - VOI fetches of 4D images work. Previously the four entries of `get_zooms()` raised `ValueError`.
    - Clip the voxel range to the image extent and raise `ValueError` if the VOI doesn't overlap the image. Previously a VOI partly below the image returned an empty array, and one entirely below it wrapped around to the end of the image.
    - Type hints; docstring for `voi`, `Returns` and `Raises`.
- `test/volumes/providers/test_nifti.py` (new).

### Tests
- `test/volumes/providers/test_nifti.py`. Each crop is checked voxel by voxel against the source image at the same physical position:
  - `test_voi_crop_with_non_unit_voxels`: 2 mm voxels.
  - `test_voi_crop_with_fractional_start`: the affine starts at the first cropped voxel.
  - `test_voi_crop_with_flipped_and_offset_affine`: MNI-like affine.
  - `test_voi_crop_on_voxel_boundaries`: four voxel sizes; no extra voxel from floating-point noise.
  - `test_voi_crop_keeps_time_axis`: 4D image.
  - `test_voi_crop_is_clipped_to_the_image`: partly below, partly beyond, outside along one axis, enclosing the image.
  - `test_voi_outside_the_image_raises`: below, beyond, outside along one axis.
  - `test_voi_clipping_keeps_time_axis`: 4D image partly outside.

### Notes
- Behaviour change: a VOI that doesn't overlap the image raises `ValueError` in `NiftiProvider.fetch`; `Volume.fetch` logs it and returns `None`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7fda94b57c6c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.