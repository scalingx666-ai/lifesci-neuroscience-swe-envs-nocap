# Issue

**Title:** BUG: Remove unused config vars from steps

## Description

### Before merging …

- [x] Changelog has been updated (`docs/source/dev.md.inc`)
- [x] Locally check `pytest mne_bids_pipeline -k ds000248`



Turned out not to be too bad with some simple `regex` and string searches.

Will create a conflict with #1141 but I'm happy to merge `main` into that one (it'll help make that diff a tiny bit smaller anyway). I'm also locally testing `pytest mne_bids_pipeline -k ds000248` so we can safely ignore the caching issue there assuming the other CI runs come back green :crossed_fingers:

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `026357f06a65`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.