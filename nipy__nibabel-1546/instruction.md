# Issue

**Title:** BF: keep the sform and qform codes across a reorientation

## Description

Reorienting an image permutes and flips its axes, but it does not move the image
into a different space, so the sform and qform codes should survive it. At
present they do not.

Writing the reoriented affine back into the header goes through
`Nifti1Pair._affine2header`, which files the affine under the default 'aligned'
sform code and marks the qform unknown. An image that dcm2niix labelled scanner
anat therefore comes back from `as_closest_canonical` with `sform_code` 2 and
`qform_code` 0, exactly as reported.

This restores whichever codes were set on the way in, in the same place
`as_reoriented` already fixes up `dim_info`, which is what you suggested in the
thread, @effigies.

A code of 0 is deliberately left alone. There was no form of that kind to
preserve, and clearing what the affine write-back just set could leave the image
with no valid form at all.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1bf9c36e2a98`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.