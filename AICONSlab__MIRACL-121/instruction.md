# Issue

**Title:** Clar-Allen Registration Update

## Description

Added functionality to clarity-allen registration function:
- Reg now warps the atlas annotation to the native space of the subject

Also updated the warping lbls from Allen to Clarity:
- Adds usage of the new output slices from reg clar-allen (see above)

Finally removed .idea files that are IDE-specific and not needed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aeb1fc8f23c9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.