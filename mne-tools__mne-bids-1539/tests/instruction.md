# Issue

**Title:** Allow writing EEG data as BDF and EEGLAB formats

## Description

## Summary
- Add `BDF`, `EDF`, and `EEGLAB` to `EEG_CONVERT_FORMATS` and `EEGLAB` to `IEEG_CONVERT_FORMATS` in `config.py` to match the write logic that already supported these formats
- Update `write.py` to include `eeg` datatype in BDF conversion/writing branches
- Add `("BDF", "eeg")` test case to `test_preload`

## Test plan
- [x] `pytest mne_bids/tests/test_write.py::test_preload -v` — all 4 cases pass (including new `BDF-eeg`)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `36271f12541b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.