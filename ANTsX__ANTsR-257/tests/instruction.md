# Issue

**Title:** Add Pad to abpBrainExtraction

## Description

I've added the `pad` argument to `abpBrainExtraction` to allow for zero-padding (and inverting that).  I think this is a good idea as I've found the "brain" goes to the edge of the image if the data doesn't have a lot of empty space but is right against the edge of the image.  

This allows the user to specify the level of padding, but it will cause problems if used with the warps without additional workups.

Example data: http://johnmuschelli.com/open_ms_data/cross_sectional/raw/patient01/T1W.nii.gz

Thoughts?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4b044681a79b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.