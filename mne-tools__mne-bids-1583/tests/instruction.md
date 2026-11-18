# Issue

**Title:** MAINT: Make testing data read-only

## Description

One little step toward #1582

1. Make `mne-testing-data` read-only. We were writing a few files there, which isn't great (I always wondered why sometimes I had an `ernoise_raw.fif` show up locally!)
2. rename `unit_tests` to `tests` for GHA (match MNE)
3. set default shell for all test commands on GHA for uniformity and DRY

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d4741e55f2ed`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.