# Issue

**Title:** Dprice80 empty mask patch

## Description

aa_modules/aamod_mask_fromsegment.m and aa_modules/aamod_mask_fromstruct.m should throw an error if the mask is empty. This prevents error messages downstream that are harder to diagnose.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `df8e950f955f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.