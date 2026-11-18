# Issue

**Title:** Fix SSVEP_TRCA trial centering and in-place data mutation

## Description

Anyone fitting `SSVEP_TRCA` (default `method="original"`) got spatial filters and class templates computed from data that had its across-channel mean removed at every sample, instead of each channel's temporal mean.

`_Q_S_estim` did `x1 -= np.mean(x1, 0)` on a squeezed view of `data[trial]`. For a `(channels, samples)` array `axis=0` is the channel axis, so a common-average reference was applied to the trials before the inter-trial covariance, and because `x1`/`x2` are views, the array passed in was modified too. In `fit` that array is the filterbank output, which `_compute_trca` receives and which `fit` then averages into `templates_`, so the templates were also affected (fitting `SSVEP_TRCA(n_fbands=3)` on SSVEP epochs from a one-subject `FakeDataset` (events 13, 17 and 21, `sfreq=256`, `seed=0`), the summed absolute template values were 0.024634985937432505 before the fix and 0.02990252791880888 after). Test data in `predict` was never centered this way.

Besides the mutation, the in-place change fed the shared `data` array that `Q` is built from afterwards, so `Q` lost a rank: on `np.random.default_rng(0).standard_normal((6, 4, 100))`, i.e. 6 trials, 4 channels and 100 samples, the old code returned a `Q` of rank 3 and an `S` that sums to 2.2e-16, the fixed code a `Q` of rank 4 and an `S` summing to 2.453106. `_compute_trca` solves `linalg.eig(S, Q)`, so a singular `Q` changes the spatial filters. The issue reports that on Han2024Fatigue, changing only this step in a diagnostic copy raised trial-wise agreement with an independent TRCA from 56.6% to 95.7% (1 s windows). I did not rerun that dataset.

The fix centers each channel over time (`axis=-1`) on a copy. The single-channel case keeps working because the trial is still squeezed to 1D before centering.

Tests (`moabb/tests/test_classification.py`):
- `test_trca_q_s_estim_does_not_modify_input`: input array is unchanged after the call.
- `test_trca_q_s_estim_matches_reference`: `S` equals the sum of inter-trial covariances, and `Q` the covariance of the concatenated trials, both computed independently with `np.cov` on fixed seeded data.

Both fail on the previous code and pass now. `_Q_S_estim_riemann` does not center per trial and is not changed. `moabb/tests/test_classification.py` and `moabb/tests/test_evaluations.py` pass; ruff check and format are clean. I added a whats_new entry.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9c6b1ccfa94c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.