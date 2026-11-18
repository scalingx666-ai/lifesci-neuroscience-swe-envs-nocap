# Issue

**Title:** Update `PolicyFillEmptySpace` (and expose `find_empty_space_peaks`) to respect `get_exclusion_mask()`, accept `min_distance`, `threshold_abs`, validated `sort_cmp` (`ascending`, `descending`, or `distance`), and `black_border` (defaulting to `True`), guard excluded and non-finite EDT voxels against spurious peaks when `threshold_abs=0`, and share `PolicyPeaks`'s concurrency semaphore.

## Description

Update `PolicyFillEmptySpace` (and expose `find_empty_space_peaks`) to respect `get_exclusion_mask()`, accept `min_distance`, `threshold_abs`, validated `sort_cmp` (`ascending`, `descending`, or `distance`), and `black_border` (defaulting to `True`), guard excluded and non-finite EDT voxels against spurious peaks when `threshold_abs=0`, and share `PolicyPeaks`'s concurrency semaphore.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `da019c57015f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.