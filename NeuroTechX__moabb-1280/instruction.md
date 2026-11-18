# Issue

**Title:** Fix PhysionetMI subjects 88, 92 and 100 recorded at 128 Hz (resample to 160 Hz)

## Description

## Problem

I ran a per-subject inventory of `PhysionetMI` on develop: all 109 subjects, `get_data` with the cache off, once with the imagery runs and once with `imagined=False, executed=True`. Every run has the same 64 EEG channels, but the rates differ:
- 106 subjects are at **160 Hz**;
- **subjects 88, 92 and 100** are at **128 Hz**, in all six imagery runs and all six execution runs.

The docstring only mentioned subject 88 and advised excluding it.

Any paradigm call that mixes one of these three subjects with another subject fails. For example, `LeftRightImagery().get_data(PhysionetMI(), subjects=[1, 88])` on develop gives:

```
ValueError: all the input array dimensions except for the concatenation axis must match exactly, but along dimension 2, the array at index 0 has size 481 and the array at index 6 has size 385
```

With `return_epochs=True` the error is `epochs[6].info['sfreq'] must match`.

## Fix

- `_load_one_run` resamples any run that is not at 160 Hz to 160 Hz. The annotations keep their times.
- 160 Hz is the rate of `METADATA`, of the summary table and of 106/109 subjects. So only subjects 88, 92 and 100 change; their signals hold no content above 64 Hz.
- The docstring note now names the three subjects instead of advising to exclude subject 88.
- `whats_new` (Bugs) asks users to delete and recompute cached epochs and results that include subjects 88, 92 or 100.

## Verification

**Real data** (Voyager, cache off, this branch):
- **All 109 subjects**: 1 channel set (64 EEG + stim) and **one rate, 160 Hz**.
- `MotorImagery().get_data(PhysionetMI(), subjects=[1, 88, 92, 100])`:
  - `X` is (756, 64, 481), with 174 / 222 / 222 / 138 epochs per subject;
  - `return_epochs=True` gives 756 epochs at 160 Hz;
  - each subject alone gives 481 samples per epoch at 160 Hz.

**Offline tests.** New `moabb/tests/test_physionetmi_sfreq.py` uses synthetic EDF reads, with `read_raw_edf`, `_load_data` and `_prefetch_nemar_sourcedata` monkeypatched and `MOABB_DOWNLOAD_PROVIDER=upstream`. It covers:
- subjects 88, 92 and 100 coming back at 160 Hz with their annotation onsets intact;
- a 160 Hz subject keeping exactly the same samples;
- `LeftRightImagery` arrays and `MotorImagery` epochs for [1, 88, 92, 100].

4 of the 5 tests fail with develop's `physionet_mi.py`; all 5 pass on this branch. pre-commit is clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `36250cdf8df3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.