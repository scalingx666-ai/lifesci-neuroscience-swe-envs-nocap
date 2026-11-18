# Issue

**Title:** [MAINT] ASR: fit_eeg_distribution docstring fixes + asr_calibrate input guards

## Description

A small bundle of documentation and defensive-hardening fixes:

- **`fit_eeg_distribution` docstring:** the `min_clean_fraction` / `max_dropout_fraction` default values were transposed relative to the signature (`0.25` / `0.1`); corrected. Also `X` was described as a 2-D `(n_channels, n_samples)` array, but the function operates on a **1-D** vector of amplitude values (it does `np.sort(X); n=len(X)`) — description fixed.
- **`asr_calibrate` non-finite guard:** a `NaN`/`Inf` in the calibration data previously propagated silently through the filter into `M`/`T` (an all-`NaN` threshold, no error). Non-finite samples are now zeroed before filtering so calibration degrades gracefully.
- **`asr_calibrate` insufficient-data guards:** raise a clear `ValueError` when the calibration data is too short to form one analysis window, or yields fewer than two threshold-estimation windows — instead of an obscure downstream error.

### Testing
Adds tests that non-finite calibration input yields finite `M`/`T`, and that too-short calibration raises a clear `ValueError`. Full `tests/test_asr.py` + `tests/test_cov.py` pass; `ruff` clean.

---
**Note:** includes the `nonlinear_eigenspace` reproducibility fix from #118 so the riemann CI test is stable regardless of what this PR changes. Once #118 merges first, that commit drops out on rebase.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d2f4494aec25`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.