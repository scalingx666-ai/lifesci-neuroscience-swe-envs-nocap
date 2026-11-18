# Issue

**Title:** Fix Castillos2023 c-VEP loaders failing for every subject (Missing event codes: [0])

## Description

## Problem

On develop, every subject of the four Castillos2023 c-VEP datasets fails to load: `CastillosBurstVEP100`, `CastillosBurstVEP40`, `CastillosCVEP100` and `CastillosCVEP40`, 48 subject/dataset pairs in all.

```
>>> CastillosBurstVEP100().get_data([1])
ValueError: The event_id dictionary has values that do not match any event codes in self.events. Please ensure that all values in event_id are present in self.events[:, 2]. Missing event codes: [np.int64(0)]
```

I reproduced this on Voyager with the released Zenodo files (record 8255618) and MNE 1.13.2:
- `get_data` (cache off) fails on all 12 subjects × 4 datasets;
- `CVEP().get_data(CastillosCVEP40(), subjects=[1, 2])` fails the same way in a Kubernetes Job, both per subject and for the arrays and epochs calls.

## Cause

```python
labels = epochs.events[..., -1]   # a view of epochs.events
labels -= np.min(labels)          # also rewrites epochs.events
data = epochs.get_data()          # MNE checks events against event_id -> fails
```

Making the labels 0-based also rewrote the epochs' event codes, so code 0 is no longer in `event_id`. MNE now validates the event codes when the (non-preloaded) epochs are read.

## Fix

- `labels = epochs.events[..., -1].copy()`. Nothing else in the loader changes.
- `whats_new` (Bugs) has an entry. Before this fix the loaders produced no data at all with current MNE, so no caches need to be deleted.

## Verification

**Real data** (Voyager, cache off, develop plus this one-line change):
- 12/12 subjects load for each of the four datasets, at 500 Hz, with 32 EEG channels and 2 stim channels.
- `CVEP().get_data(CastillosCVEP40(), subjects=[1, 2])` returns 7020 epochs per subject (60 trials × 117 windows), and `X` is (14040, 32, 126). This matches the 5820 NT / 1200 T in `summary_cvep.csv`.

**Offline tests.** New `moabb/tests/test_castillos2023_events.py` uses a synthetic EEGLAB read with annotations shaped like the released files (`collects` / `[bits]_k` / `iti`). It covers:
- all four classes loading;
- the trial-meta annotations and `stim_trial` codes carrying the 0-based labels at the trial onsets;
- the codebook being indexed by the same labels;
- a `CVEP` paradigm call on two subjects.

All 5 tests fail on develop with the same `Missing event codes: [0]`, and pass on this branch. pre-commit is clean.

## Not in this PR

The released files use two channel layouts:
- subjects 1, 5, 6, 7, 11 and 12 use LiveAmp-32 (F9/P9/P10/F10);
- subjects 2, 3, 4, 8, 9 and 10 use actiCAP-32 (FT9/TP9/TP10/FT10), in a different channel order.

With this fix applied, arrays stack different electrodes at the same index across these two groups, and `return_epochs=True` fails with `epochs[1].info['ch_names'] must match`. That is fixed in a separate PR.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0d795a95c555`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.