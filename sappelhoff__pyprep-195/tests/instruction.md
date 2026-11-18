# Issue

**Title:** Vectorize bandpass filtering in NoisyChannels._get_filtered_data

## Description

## Summary

Vectorize the bandpass filter in `NoisyChannels._get_filtered_data` by filtering all channels at once with `scipy.signal.filtfilt(..., axis=1)` instead of looping `filtfilt` over each channel into a pre-allocated `np.zeros_like` buffer.

The per-channel loop recomputed the FIR initial conditions (`lfilter_zi` → `linalg.solve`) once per channel; `axis=1` computes them once and runs the filter in C across all rows.

## Why

`_get_filtered_data` dominates the runtime of `find_bad_by_correlation` (and any path that needs the filtered signal). On an 18.5-min, 99-channel @ 500 Hz recording:

- `filtfilt` step: **9.98 s → 2.40 s (4.16×)** (clean wall-clock, median of 5)
- `find_bad_by_correlation`: **12.14 s → 5.06 s (2.40×)**
- It also drops the explicit full-size `np.zeros_like` output buffer.

## Correctness

Bit-for-bit identical output — `filtfilt` along `axis=1` applies the same per-row algorithm, and `lfilter_zi` depends only on the filter coefficients, not the data:

- `np.array_equal` with the old per-channel loop, maxdiff `0.0`, on the real recording and random arrays of shapes `(64, 9601)`, `(10, 1000)`, `(1, 5000)`, `(99, 553759)`.
- Full test suite passes (47 passed), including `tests/test_matprep_compare.py` (numeric MATLAB-PREP equivalence).
- `get_bads(as_dict=True)` and all `_extra_info` arrays unchanged on the real recording (reject `"omit"` and `None`) and the eegbci fixture (`matlab_strict` `False` and `True`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `54e2554ad116`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.