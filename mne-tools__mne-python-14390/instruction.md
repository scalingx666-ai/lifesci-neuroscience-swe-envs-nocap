# Issue

**Title:** FIX: Include eyetrack channels in baseline correction

## Description

This Fixes

### Description of the problem
In #13723, eyetracking channels were set to `eyetrack=False` in `_PICK_TYPES_DATA_DICT` so that `picks='data'` (e.g. in `ICA.fit`) would exclude non-neural channels.

However, baseline correction in `BaseEpochs` (both when initializing `mne.Epochs(..., baseline=...)` and in `epochs.apply_baseline()`) relies on `_detrend_picks`, which calls:
```python
_pick_data_channels(self.info, with_ref_meg=True, with_aux=True, exclude=())

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `995ee6255b04`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.