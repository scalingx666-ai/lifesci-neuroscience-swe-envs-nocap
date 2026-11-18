# Issue

**Title:** WIP .hdr writer

## Description

WIP because `write_nifti` is so ugly now that I didn't found the courage to make `write_rgb_nifti` work too. I would be really interested in your review. Like, how I can make this less ugly. Or even beautiful!

I added a lot of `#[cfg(feature = "ndarray_volumes")]` for `is_hdr_file` because it's currently only used with `ndarray_volumes`, but this will be removed "soon" when we support writing nifti-rs types.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f30c13dcf3dc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.