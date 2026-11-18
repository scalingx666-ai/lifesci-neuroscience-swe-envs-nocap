# Issue

**Title:** Castillos2023: return the 28 electrodes both released channel layouts share (builds on #1279)

## Description

**Builds on #1279**, which fixes the `Missing event codes: [0]` failure. Without #1279 these datasets do not load at all, so this branch contains that commit too. Only the last commit, "Castillos2023: return the 28 electrodes both released layouts share", is new here. Once #1279 is merged, the diff shrinks to that commit.

## Problem

I read all 48 released `.set` files on Voyager (12 subjects × 4 conditions; Zenodo record 8255618) with `mne.io.read_raw_eeglab` directly. They use **two 32-channel layouts**, and each subject has the same layout in all four conditions:

| subjects | labels (file order) |
|---|---|
| 1, 5, 6, 7, 11, 12 (LiveAmp-32) | `Fp1 Fz F3 F7 F9 FC5 FC1 C3 T7 CP5 CP1 Pz P3 P7 P9 O1 Oz O2 P10 P8 P4 CP2 CP6 T8 C4 Cz FC2 FC6 F10 F8 F4 Fp2` |
| 2, 3, 4, 8, 9, 10 (actiCAP-32) | `Fp1 Fz F3 F7 FT9 FC5 FC1 C3 T7 TP9 CP5 CP1 Pz P3 P7 O1 Oz O2 P4 P8 TP10 CP6 CP2 Cz C4 T8 FT10 FC6 FC2 F4 F8 Fp2` |

The two layouts differ in four electrodes (F9/P9/P10/F10 versus FT9/TP9/TP10/FT10), and from index 9 on they also store the channels in a different order. The loader kept each file's labels and order, with these consequences:
- **Arrays silently stack different electrodes at the same index across the two groups.** For example, index 9 is CP5 for subject 1 and TP9 for subject 2, and index 23 is T8 for subject 1 and Cz for subject 2. With #1279 applied, `CVEP().get_data(CastillosCVEP40(), subjects=[1, 2])` returns `X` of shape (14040, 32, 126) without any warning.
- `return_epochs=True` fails with `epochs[1].info['ch_names'] must match`.
- `METADATA` listed only the LiveAmp labels.

## Fix

- Every subject now gets the **28 electrodes both layouts share, in one fixed order**: `Fp1 Fz F3 F7 FC5 FC1 C3 T7 CP5 CP1 Pz P3 P7 O1 Oz O2 P8 P4 CP2 CP6 T8 C4 Cz FC2 FC6 F8 F4 Fp2`. The data of each electrode are unchanged; only the four layout-specific electrodes are dropped. The occipital channels used for c-VEP decoding are all kept.
- A file whose channels are not the 28 shared electrodes plus one of the two known sets of four raises a `ValueError`.
- `METADATA` (`channel_types`, `sensors`) and `summary_cvep.csv` now list 28 EEG channels. The class docstrings document the two layouts.
- `whats_new` (Bugs) asks users to delete and recompute cached Castillos2023 epochs and results.

A `cohort` option returning each layout's full 32 channels, as in #1275 and #1276, could follow if wanted. With four classes, it would need four extra dataset codes.

## Verification

**Real data** (Voyager, cache off, this branch):
- All four datasets load 12/12 subjects, with **1 channel set (28 EEG + 2 stim)** and 1 rate (500 Hz).
- `CVEP().get_data(CastillosCVEP40(), subjects=[1, 2])`, where subject 1 is LiveAmp and subject 2 is actiCAP: `X` is (14040, 28, 126) with 7020 epochs per subject, and `return_epochs` gives 14040 epochs with the shared channel order.
- The same holds for `CastillosBurstVEP100` with subjects [3, 5] (one subject from each layout).

**Offline tests.** New `moabb/tests/test_castillos2023_channels.py` uses synthetic EEGLAB reads with the released label order. Each electrode carries its own sinusoid, so a channel that is moved to the wrong index is detected. The tests cover:
- all 12 subjects returning `_SHARED_EEG` in order, with each electrode's own signal;
- `METADATA` matching the returned channels;
- `return_epochs` across both layouts, and arrays that are identical per index for subjects 1 and 2;
- unknown layouts raising.

16 tests pass, and the #1279 tests pass on top of this change. `test_metadata.py` passes (290 tests), and pre-commit is clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5936fd13f053`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.