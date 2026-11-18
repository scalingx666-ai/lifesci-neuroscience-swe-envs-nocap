# Issue

**Title:** FIX allow any character in mask name

## Description

The regex in `_find_mask` only allowed word characters in the name, so a mask name such as `mask_v1+v2+v3.nii.gz` would not be recognized.

This PR makes the regex more general. However, there's an argument to be made whether we should allow "+" in mask filenames. If we don't want, then we should enforce proper filenames in `cortex.db.save_mask`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `35ebd434b733`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.