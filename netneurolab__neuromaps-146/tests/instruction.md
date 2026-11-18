# Issue

**Title:** [FIX] Fix interface changes from nilearn

## Description

In nilearn/nilearn/pull/4086 (first released with nilearn 0.10.3), 
- `nilearn.datasets.utils._fetch_files()` was refactored to `nilearn.datasets._utils.fetch_files()`
- `nilearn.datasets.utils._fetch_file()` was refactored to `nilearn.datasets._utils.fetch_single_file()`
- `nilearn.datasets.utils._md5_sum_file()` was refactored to `nilearn.datasets._utils._md5_sum_file()`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `efef83843323`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.