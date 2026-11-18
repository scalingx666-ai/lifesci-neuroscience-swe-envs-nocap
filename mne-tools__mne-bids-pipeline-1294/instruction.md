# Issue

**Title:** Nest expensive imports to speed up startup

## Description

No need for changelog update. Toward  Takes `mne_bids_pipeline --help` from ~1200 ms to ~900 ms.

Investigated and drafted changes with Claude Opus 5 and I reviewed changes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4de4f358ab21`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.