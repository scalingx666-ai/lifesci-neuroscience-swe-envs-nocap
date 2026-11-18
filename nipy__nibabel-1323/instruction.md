# Issue

**Title:** ENH: Add Nifti2 capabilities to nib-nifti-dx

## Description

Was having trouble understanding why some NIfTIs were behaving weirdly, when I realized they were NIfTI-2.

Could spend a little more time adding auto-detection, but for right now being able to toggle 1/2 is enough for me. Still defaults to 1.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f40ac39994ee`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.