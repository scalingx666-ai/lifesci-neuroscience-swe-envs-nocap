# Issue

**Title:** [FIX] ASR: uncentered scm block covariance + overlap/bound/jump fixes

## Description

Fixes a coordinated cluster of issues in `block_covariance`:

- **Uncentered scm covariance:** for `estimator="scm"` compute the uncentered per-block second moment `E[x x.T] = B @ B.T / window` directly, matching `ASR.transform` (`cov = 1/N * X @ X.T`) and the ASR spec (the calibration covariance is not mean-subtracted). pyriemann's `scm` mean-centers each block, which diverges the calibration matrix `M` from the correct value on real data and makes calibrate inconsistent with transform. Other estimators still route through pyriemann `covariances`.
- **Loop bound:** the loop bound is now computed against the padded length. Previously `n_samples` was captured before padding, so padding added zero iterations and trailing samples were dropped. A window too large to form any complete block now raises a clear `ValueError`.
- **Overlap convention:** `jump` now uses `round(window * (1 - overlap))` so `overlap` is the fraction of overlap (higher = more overlap), matching `clean_windows` and `asr_calibrate`. Previously a larger overlap produced a larger jump (less actual overlap).
- **Robustness:** `jump` is clamped to `>= 1` so zero-overlap no longer loops forever, and `window` is cast to `int` so fractional windows don't break slicing.

### Testing
Adds one regression test per fix. Full `tests/test_asr.py` passes; `ruff` clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ba7aa78e240a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.