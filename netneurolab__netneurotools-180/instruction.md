# Issue

**Title:** [ENH] Add `agg_method` parameter in `vertices_to parcels`

## Description

This commit adds an `agg_method` parameter in `vertices_to_parcels`. This parameter specifies which method to use to aggregate values. We were using `np.nanmean`. This parameter would allow the user to use `np.nanmedian` or `scipy.stats.mode` instead to aggregate values.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ce47bc05380a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.