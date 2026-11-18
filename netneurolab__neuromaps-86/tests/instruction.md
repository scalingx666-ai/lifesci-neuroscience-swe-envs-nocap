# Issue

**Title:** [FIX] Fix nan_policy related bug in compare_images

## Description

This PR fixes a bug in `compare_images`.

 `nan` values were dropped from `srcdata` and `trgdata` regardless of whether `nan_policy` was set to `omit` or `propagate`. This is not what we want: we want to keep the `nan` values when `nan_policy` is set to `propagate`, so that the metric function can handle these values however it wants.

This bug might be related to issue #77.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b5c37bd4d3c5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.