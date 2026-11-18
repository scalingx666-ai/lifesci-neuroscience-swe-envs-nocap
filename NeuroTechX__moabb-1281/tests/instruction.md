# Issue

**Title:** Fix Mainsah2025 (BigP3BCI) per-run sampling rates from truncated EDF headers (relabel at 256 Hz)

## Description

## Problem

I ran a per-subject inventory of all 20 BigP3BCI studies on develop (`Mainsah2025_A` … `Mainsah2025_S2`): 327 subjects and 6980 runs, loaded with `get_data` and the cache off.
- Every study has a single channel set.
- **3859 runs** have a sampling rate that is not exactly 256 Hz, such as 256.0000587, 256.00008, 256.00009 or 256.000124 Hz.
- In studies A, B, C, L, O, P, Q and R the rate also **differs from run to run within the same subject**. For example, B has 12 distinct values and P has 19.
- S1 and S2 are at a single rate of 256.0000766 Hz for every run.

The cause is that each EDF stores the whole run as one data record, and its 8-character duration field is truncated. For example, 35208 samples / 256 Hz = 137.53125 s is written as `137.5312`, and MNE then derives 256.00009 Hz.

Arrays are not affected. But `return_epochs=True`, and anything else that concatenates epochs (e.g. braindecode pipelines), fails even for a single subject. On develop, with `P300` and subjects [1, 2]:
- study A: `ValueError: epochs[3].info['sfreq'] must match`;
- study O: `ValueError: epochs[5].info['sfreq'] must match`.

## Fix

- New `_restore_nominal_rate`: if a run's header rate is explained by this truncation (under one sample of drift over the run), the run is relabelled at exactly 256 Hz. There is no resampling: samples, annotations and `meas_date` are unchanged.
- Any other rate raises a `ValueError`.
- 256 Hz is the g.USBamp rate documented for every study, and `METADATA` uses the same constant.
- The docstring explains the header artefact.
- `whats_new` (Bugs) asks users to delete cached `Mainsah2025-*` epochs and recompute.

## Verification

**Real data** (Voyager, cache off, this branch, all 20 studies including the large Q (36 subjects) and R): all 327 subjects and 6980 runs load, with 0 errors and **one rate, exactly 256.0 Hz**. In each study the channel set and the number of runs per subject are the same as on develop.

`P300().get_data(..., subjects=[1, 2])`:
- study A: `X` is (51696, 32, 257) and `return_epochs` gives 51696 epochs;
- study O: `X` is (24360, 32, 257) and `return_epochs` gives 24360 epochs.

Both `return_epochs` calls failed on develop.

**Offline tests.** New `moabb/tests/test_mainsah2025_sfreq.py` uses synthetic EDF content with the header rates of real files. It covers:
- relabelling without changing any sample;
- `_load_edf` keeping the stimulus events on the same samples;
- other rates (250 Hz) raising;
- `return_epochs` across runs with different header rates (this failed on develop).

The new test file passes locally (4 tests), and pre-commit is clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `17d77bf7b819`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.