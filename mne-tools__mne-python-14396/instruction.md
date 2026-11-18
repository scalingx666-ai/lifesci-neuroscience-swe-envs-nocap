# Issue

**Title:** FIX: Fix montage handling for EOG channels in EEGLAB reader

## Description

- Fixes

Gemini 3.8 flash helped with writing the code for this one

### Summary
When reading EEGLAB files with channel positions and EOG channels:
- `_get_montage_information()` only adds channels whose type is in `("eeg", "seeg", "dbs", "ecog")` to `DigMontage`.
- `_get_info()` prunes any channels designated via the `eog` parameter from `eeg_montage`.
- `_set_dig_montage_in_init()` calls `self.set_montage(montage, on_missing="ignore")` instead of padding missing channels with dummy NaN coordinates.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `995ee6255b04`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.