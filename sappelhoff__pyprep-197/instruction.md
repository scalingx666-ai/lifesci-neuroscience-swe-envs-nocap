# Issue

**Title:** Use direct NumPy MAD in the windowed correlation loop

## Description

## Summary

Replace the two `scipy.stats.median_abs_deviation(..., axis=1)` calls in the windowed loop of `find_bad_by_correlation` with the equivalent direct NumPy expression `np.median(np.abs(x - np.median(x, axis=1, keepdims=True)), axis=1)`.

## Why

`median_abs_deviation` carries a `scipy` `axis_nan_policy` wrapper (broadcast/concatenate bookkeeping) that adds noticeable overhead when called many times on small arrays — here roughly 2× per correlation window (~1100 windows). On an 18.5-min, 99-channel @ 500 Hz recording:

- the MAD call itself: **~1.58×** faster
- `find_bad_by_correlation`: **5.06 s → 4.51 s** (on top of #195)

## Correctness

The default `median_abs_deviation` (scale `1.0`, center = median) is exactly `median(|x − median(x)|)`:

- `np.array_equal`, maxdiff `0.0` against `median_abs_deviation` in a direct micro-check.
- Full test suite passes (47 passed), including `tests/test_matprep_compare.py`.
- `get_bads(as_dict=True)` and all `_extra_info` arrays (including the per-window `max_correlations`, `noise_levels`, `channel_amplitudes`) unchanged on the real recording (reject `"omit"`/`None`) and the eegbci fixture (`matlab_strict` `False`/`True`).

Note: the same swap would also speed up `find_bad_by_nan_flat` and `find_bad_by_hfnoise`; kept out here to keep the diff minimal — happy to follow up if wanted.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8d2c7b6a272f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.