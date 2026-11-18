# Issue

**Title:** Fix Ofner2017 subject 1 EOG order and Armeo placeholders breaking return_all_modalities

## Description

## Problem

I inventoried `Ofner2017` on develop: all 15 subjects, 300 runs, `get_data` with the cache off. EEG is identical in every run (61 channels, 512 Hz). Subject 1's runs, however, differ from everyone else's in their **EOG and misc channels**:
- **Execution session (10 runs):** the EOG channels are stored as `eog-r, eog-m, eog-l`. Every other run has `eog-l, eog-m, eog-r`.
- **Imagination session (10 runs):** the 13 Armeo arm-kinematics channels (`handPosX` … `GripPressure`) are replaced by `armeodummy-0` … `armeodummy-12`. These hold random values (about ±50, std 11).

I read all 300 GDF files directly. The Armeo channels are NaN in 270 runs, hold kinematics in 20 runs, and are the placeholders in the 10 runs above.

The default (EEG only) output is not affected. With `return_all_modalities`, on develop with `MotorImagery` and subjects [1, 2]:
- `return_all_modalities=True`: `return_epochs` fails, even for subject 1 alone, with `ValueError: epochs[10].info['ch_names'] must match`. Arrays are returned without an error but mix two channel sets.
- `return_all_modalities={"eeg": True, "eog": True}`: `return_epochs` fails with `Channel order must match`. **Arrays silently swap eog-l and eog-r** for subject 1's execution runs.

## Fix

- Every run gets the majority channel layout:
  - the EOG channels are reordered by name, so the data move with their labels;
  - the placeholders are renamed to the Armeo names and set to 0, which is what the loader already returns for the 270 runs without an Armeo recording (NaN → 0).
- `METADATA.acquisition.sensors` lists the Armeo names instead of `armeodummy-*` (still 96 sensors). `channel_types` and the summary table are unchanged.
- The class docstring documents both quirks.
- `whats_new` (Bugs) asks users to delete and recompute cached epochs and results that were computed with `return_all_modalities`.

## Verification

**Real data** (Voyager, cache off, this branch):
- **All 15 subjects** with `return_all_modalities=True` (300 runs): one channel set (61 EEG, 3 EOG, 32 misc, stim) at 512 Hz.
- `MotorImagery`, subjects [1, 2], each run with 840 epochs per subject:

  | `return_all_modalities` | arrays | `return_epochs` |
  |---|---|---|
  | `True` | (1680, 96, 1537) | 1680 epochs, EOG order eog-l, eog-m, eog-r |
  | `{"eeg": True, "eog": True}` | (1680, 64, 1537) | OK |
  | default | (1680, 61, 1537) | same as develop |

**Offline tests.** New `moabb/tests/test_ofner2017_channels.py` uses synthetic GDF reads in which each channel carries its own signal. It covers:
- subject 1's runs getting subject 2's layout, with the EOG data following their labels and the Armeo channels at 0;
- other subjects keeping identical data;
- `return_epochs` for both `return_all_modalities` forms;
- `METADATA` sensors.

3 of the 5 tests fail on develop with the same errors as the real data; all 5 pass on this branch. `test_metadata.py` passes, and pre-commit is clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f996da50f0e3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.