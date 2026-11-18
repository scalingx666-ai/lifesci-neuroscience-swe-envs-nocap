# Issue

**Title:** ENH: Support writing displacement field transforms with write_transform

## Description

write_transform previously rejected displacement-field transforms at the native binding. This change supports saving them directly as .nii/.nii.gz images or as single-component composite transforms in .h5/.hdf5 files.

ENH: Deprecate transform_to_displacement_field "ref" argument

- Make transform_to_displacement_field’s ref argument optional, using the stored field’s geometry and region by default.
- Deprecate explicit references while preserving their existing behavior.

I don't understand the point of 'ref'. It doesn't resample the deformation field if given a ref of a different shape or orientation. It also doesn't do any bounds checking. Seems like it should just use the transform's own metadata, ref is only correct if it's the same.

Other changes:

- Reject NIfTI output for affine and composite transforms with a clear error.
- Document supported formats and the composite representation used for displacement-field HDF5 output. Validation: passing 2D/3D tests cover affine round trips through TXT, MAT, and HDF5; displacement-field round trips through NIfTI and HDF5; and mixed affine/displacement composite HDF5 round trips. Tests check point mappings, field values and geometry, and compatibility with explicit references.

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b3ab93e69781`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.