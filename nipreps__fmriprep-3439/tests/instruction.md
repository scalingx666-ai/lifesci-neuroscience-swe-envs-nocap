# Issue

**Title:** fix: Detect and apply precomputed fieldmaps

## Description

This is the last step for using pre-computed derivatives without recomputing. I'm able to target native, T1w, MNI and fsLR spaces using this.

This is mainly about fieldmaps in `fmriprep.workflows.base`, but other things fixed in passing:

1) Reporting for bold2anat registration now says "precomputed". This is necessary because fallbacks are not attempted if no registration is attempted.
2) Consolidates populating precomputed derivative buffers.

`--use-syn-sdc` still needs to be declared if SyN-SDC fieldmaps are to be used.

There's still a minor bug, or missed opportunity, in `workflows.bold.fit` to make sure that fieldmaps are reported even if coregistration is already done. It doesn't feel like it's worth holding this PR up to make that happen.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f81a3040e9c3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.