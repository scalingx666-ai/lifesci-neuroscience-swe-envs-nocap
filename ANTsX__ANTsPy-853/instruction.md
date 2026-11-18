# Issue

**Title:** BUG: label_geometry_measures with uint32 labels

## Description

To save an unnecessary clone, we were lazily cloning the data but if the labels are actually uint32, the variable wasn't properly initialized.

For label_stats, add checks that labels are unsigned. Also re-index data in the returned DF by label - it was previously sorted by label, but the pandas index was not updated, so a merge on index would be wrong

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cdf373f8c68b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.