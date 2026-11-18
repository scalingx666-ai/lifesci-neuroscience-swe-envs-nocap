# Issue

**Title:** Fix PerezBlanco2026 subject 9 run stored at ~1200 Hz (resample to 512 Hz)

## Description

## Problem

A per-subject inventory of `PerezBlanco2026` on develop loaded all 45 subjects (448 runs) with `get_data`, cache off. All runs have the same 8 EEG channels, but there are two rates:
- 447 runs at **512 Hz**;
- one run at **1199.4 Hz**: subject 9, run 0 = `sub-09_task-WristPointingTask_run-01_eeg.edf`.

Its EDF header has 60033 records of 8 samples, with record duration `0.00667` s. That is a ~1200 Hz recording whose record duration was rounded to 1199.4 Hz. Run 03 of the same subject has 8 samples per `0.015625` s, i.e. 512 Hz. The dataset has no `*_eeg.json` sidecar that could say otherwise.

`MotorImagery().get_data(PerezBlanco2026(), subjects=[8, 9])` on develop:

```
ValueError: all the input array dimensions except for the concatenation axis must match exactly, but along dimension 2, the array at index 0 has size 1281 and the array at index 10 has size 3000
```

With `return_epochs=True` it fails with `epochs[10].info['sfreq'] must match`. It fails even for subject 9 alone (`epochs[1].info['sfreq'] must match`).

## Fix

- `_build_run` now resamples any run that is not at 512 Hz to 512 Hz. The events are located first, on the native samples from the BCI2000 state channels, and their annotation times survive the resampling.
- 512 Hz is the rate of every other run, of `METADATA` and of the summary table. Only the one run changes.
- The docstring documents the exception.
- `whats_new` (Bugs) asks users to delete cached subject-9 epochs and results.

## Verification

**Real data** (Voyager, all 45 subjects, cache off): on this branch, 45/45 subjects, 1 channel set and 1 rate (512 Hz). With `MotorImagery`, subjects [8, 9]:
- `X` is (800, 8, 1281), 400 trials each;
- `return_epochs` gives 8 channels at 512 Hz.

**Offline tests.** New `moabb/tests/test_perezblanco2026_sfreq.py` uses synthetic BCI2000-like EDF content, with `read_raw_edf` and `_prefetch_nemar_sourcedata` monkeypatched and `MOABB_DOWNLOAD_PROVIDER=upstream`. It covers:
- the off-rate run being resampled with its events within one sample of the native onsets;
- 512 Hz runs being untouched (identical samples and event indices);
- a paradigm call on subjects 8 + 9. On develop this test fails with the same `1281 ... 3000` error;
- other rates (256 and 1024 Hz) being brought to 512 Hz.

Local runs: the new test file and `test_archive_c_regression.py` pass (16 tests), and pre-commit is clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c01eb52f9302`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.