# Issue

**Title:** [FIX] ASR: asr_calibrate must pass step_sizes to fit_eeg_distribution

## Description

`fit_eeg_distribution`'s `step_sizes` default was `[0.0220, 0.6000]`, an accidental copy of the `fit_quantiles` default. That value collapses the scale grid search to essentially a single point, so `asr_calibrate` (which called `fit_eeg_distribution` without `step_sizes`) inherited a degenerate grid, biasing the fitted `mu`/`sig` and hence the threshold matrix `T`. The function's own docstring already documents `default=[0.01, 0.01]`, matching the value `clean_windows` passes explicitly.

Correct the signature default to match the docstring, and have `asr_calibrate` pass `step_sizes=[0.01, 0.01]` explicitly so its behavior no longer depends on the default.

### Testing
Added a regression test that builds a windowed-RMS vector from the `eeg_raw.npy` fixture and asserts the default fit now matches an explicit `[0.01, 0.01]` call while diverging materially from the old `[0.022, 0.6]` default. Full `tests/test_asr.py` passes; `ruff` clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `107cd1bfae9f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.