# Issue

**Title:** [Schema][Fix] add checks for multiple frame consistency issues

## Description

This was discovered by @mnoergaard during the processing of a dataset recently uploaded to openneuro -> 

(Not a validator issue 👍 )

This adds checks for the following cases:

- Number of frames differ between nifti, FrameDuration, and FrameTimesStart
- Number of frames mismatch between FrameDuration and nifti
- Number of frames mismatch between FramesTimeStart and nifti
- Number of frames mismatch between FramesTimesStart and FrameDuration when nifti header is null (`--ignoreNiftiHeader` flag use case)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `92e540056a74`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.