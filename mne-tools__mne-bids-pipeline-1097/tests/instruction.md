# Issue

**Title:** FIX: sanitize tags

## Description

### Before merging …

- [x] Changelog has been updated (`docs/source/dev.md.inc`)


### Description
Currently, contrasts from metadata (e.g., `cond == "A"`) won't create valid report tags due to illegal characters (`"`, `'`).
PR properly sanitizes these tags. Added metadata-based decoding to test suite in `ds001810`.


edit: Wondered if this should be fixed at `mne-python` level, but really only an issue if you auto-generate tags.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9c36886cae3c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.