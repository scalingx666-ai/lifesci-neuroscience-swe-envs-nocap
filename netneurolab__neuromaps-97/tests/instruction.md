# Issue

**Title:** [ENH] Add option to return nulls in `compare_images()`

## Description

Added a new parameter `return_nulls` to `neuromaps.stats.compare_images()`. If `True` and `nulls` is not None, `compare_images()` will return the similarity metric, p-value, and the distribution of null similarity metrics used to generate the p-value. See Issue #93 for some discussion on this.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `96ff4f079b3d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.