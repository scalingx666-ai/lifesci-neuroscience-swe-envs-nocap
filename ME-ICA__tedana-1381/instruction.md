# Issue

**Title:** Convert 3D AFNI volumes to actual 3D

## Description

.

nibabel reads in 3D AFNI volumes with a 4th dimension of length 1. This causes problems with some nilearn commands.

Changes proposed in this pull request:

- Added `max_dims` option to `io._convert_to_nifti1` If a volume has more than the desired dimensions, it will remove trailing dimensions of length 1 or raise an error
- When data is loaded for a mask, set `max_dims` to 3.
- `io._convert_to_nifti1` was inconsistently used with `nb.load` For any call of `nb.load` that isn't inherently for a nifti file previously outputted by tedana, wrap it with `io._convert_to_nifti1`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cae949f6fa1c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.