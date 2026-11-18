# Issue

**Title:** Added 2 channel smoothed test for registration module.

## Description

PR addresses issue #371. 

- 1Preg test was removed.
- regression test for 2channels with `smooth_sigma_time` = 1 was added. 
- Refactoring of `prepare_for_registration` function to accommodate multiple channels and planes.
- Added 2channels smoothed test data.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f57b9bf0dd9e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.