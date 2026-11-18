# Issue

**Title:** [FIX] ASR: correct reconstruction dim count, blend seam, and RMS window rounding

## Description

Three independent fixes in the calibration/reconstruction path:

- **maxdims / keep-mask off-by-one in `asr_process`:** `maxdims` used `np.fix` (truncate toward zero) instead of round-half-away, and the keep-mask index term protected one component too many. The spec converts the fractional `0.66` factor with round-half-away-from-zero, and its 1-based `(1:C) < (C - maxdims)` protects `C-maxdims-1` components, so use `int(np.floor(0.66 * nc + 0.5))` and `np.arange(nc) < nc - maxdims - 1`. Together these made the code under-remove artifact dimensions.
- **Raised-cosine blend endpoint in `asr_process`:** `np.arange(ns)/ns` never reaches 1, so the block's final sample kept a residual fraction of the previous reconstruction. Shift the phase to `np.arange(1, ns + 1)/ns` so `blend[-1] = 1.0` and the last sample equals the new reconstruction.
- **RMS window starts in `asr_calibrate`:** the step `N*(1-win_overlap)` was rounded before building the window starts, drifting from the correct positions for a non-integer step (biasing `mu`/`sig`/`T`). Extract a `_rms_window_offsets` helper that rounds each start (matching `clean_windows`).

### Testing
Adds a regression test for each. Full `tests/test_asr.py` passes; `ruff` clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3b0c5308e70c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.