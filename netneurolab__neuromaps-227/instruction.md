# Issue

**Title:** [FIX] Rank nulls when using Spearman

## Description

- Enhanced `compare_images` and `permtest_metric` to rank nulls when using the 'spearmanr' metric.
- Added a new helper function `_rank_nulls` for ranking nulls while preserving NaNs.
- Updated scipy version requirement from 0.17 to 1.4.0 in `pyproject.toml` and `requirements.txt`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ec50f9f29731`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.