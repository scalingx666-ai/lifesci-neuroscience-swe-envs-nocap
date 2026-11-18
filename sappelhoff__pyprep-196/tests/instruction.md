# Issue

**Title:** Detrend in place in NoisyChannels.__init__ to avoid full-array copies

## Description

## Summary

Detrend the EEG signal in place during `NoisyChannels.__init__`, avoiding two transient full-size copies of the recording during construction.

- `removeTrend` gains a `copy=True` keyword argument that is passed through to `mne.filter.filter_data`. The default (`copy=True`) preserves the exact current behavior for every existing caller.
- `NoisyChannels.__init__` now calls `removeTrend(self.raw_mne._data, ..., copy=False)` instead of `removeTrend(self.raw_mne.get_data(), ...)`.

## Why

The previous code allocated two avoidable full-array copies while detrending:

1. `get_data()` always returns a copy (verified: it does not share memory with `_data`).
2. `mne.filter.filter_data(copy=True)` allocates a separate output buffer.

Filtering in place removes both. On an 18.5-min, 99-channel @ 500 Hz recording (~439 MB), `filter_data` peaks at **+887 MB → +443 MB** (one full-array transient removed), and `__init__` drops from ~1.94 s to ~1.77 s.

The `matlab_strict` path already filters in place, so `copy` only affects the default (MNE high-pass) branch.

## Correctness

- `mne.filter.filter_data(copy=False)` is bit-identical to `copy=True` (verified `np.array_equal`); `copy` only controls whether MNE allocates a new array.
- Full test suite passes (47 passed), including `tests/test_matprep_compare.py`.
- `get_bads(as_dict=True)` and all `_extra_info` arrays unchanged on the real recording (reject `"omit"`/`None`) and the eegbci fixture (`matlab_strict` `False`/`True`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `24530cb73107`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.