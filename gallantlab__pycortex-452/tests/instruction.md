# Issue

**Title:** FIX,DOC exception in get_roi_masks

## Description

Previously the code would fail because `gm_mapper` was undefined.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b558e78eec01`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.