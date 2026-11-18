# Issue

**Title:** NF: convert nipy image with 'unknown' world to nii

## Description

We previously raised an error if we had a nipy image with the 'unknown'
image space when converting to nifti, because 'unknown' cannot be stored
in nifti unless the affine is discarded.  But, if the affine of the
image to be converted is already the same as that resulting from
discarding the affine, there's no harm, and it allows us to round-trip
images without specified (`sform, qform`) affines.

Closes issue gh-238

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d0db70213229`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.