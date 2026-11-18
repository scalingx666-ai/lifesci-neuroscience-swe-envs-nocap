# Issue

**Title:** Improve test disk usage and I/O in tests

## Description

I/O companion to  a few low-hanging fruit for speeding up tests further:

- change some `_TempDir` to `tmp_path`
- copy fewer files (e.g. for `subjects_dir_tmp`, only copy fsaverage when needed)
- add some raw/event crops when the test can still test reasonably with less data
- cache reads of small data and reuse them with `.copy` in fixtures

Changes drafted by Claude Fable 5 and reviewed/iterated on by me

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0b6cbf0cdfc5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.