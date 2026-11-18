# Issue

**Title:** FIX: Sleuth to NiMADS

## Description

Fixes Sleuth to NiMADS conversion

- Doesn't auto convert Tal to MNI
- This is possible because if no masker or target space is passed to Dataset, it won't convert coordinates now
- Also splits analyses on semi column in Sleuth files, which is common practice

## Summary by Sourcery

Fix Sleuth-to-NiMADS conversion to respect the original coordinate space and improve parsing of Sleuth files

Bug Fixes:
- Prevent automatic Talairach-to-MNI conversion when no target space is specified

Enhancements:
- Split study and analysis names on semicolons (falling back to colons or defaults)
- Use None as the default target in dataset loading and Sleuth-to-NiMADS conversion to preserve the file’s reference space
- Refactor coordinate transformation utilities to remove masker dependency and only apply transformations when a target space is provided

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ae76e0a9f8c9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.