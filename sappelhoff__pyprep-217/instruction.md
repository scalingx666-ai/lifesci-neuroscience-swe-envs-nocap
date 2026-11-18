# Issue

**Title:** Add average_reference option to NoisyChannels

## Description

Adds a keyword-only `average_reference=False` parameter to `NoisyChannels`.

## Why

Users who want to detect bad channels on average-referenced data currently have to re-reference the `Raw` before passing it in. That has three problems:

- **Flat and NaN channels become undetectable.** After `set_eeg_reference("average")`, a flat channel `c` becomes `c - mean(all channels)` and carries the variance of the mean signal, so `find_bad_by_nan_flat` (run in `__init__`) no longer flags it. A single NaN channel spreads into every channel through the average.
- **Dropouts become undetectable.** A flat stretch in an otherwise good channel carries `-mean(other channels)` instead of a flat signal, so `bad_by_dropout` in `find_bad_by_correlation` never triggers.
- **Unusable channels contaminate the reference.** Manually marked, NaN, and flat channels are averaged into every other channel before detection runs.

## What

With `average_reference=True`, `__init__` runs `find_bad_by_nan_flat` on the data as passed (unchanged), builds `EEGData` from the usable channels (not bad-by-NaN, bad-by-flat, or manually marked) as before, and then subtracts their mean from `EEGData`, before `EEGFiltered` is computed and before any other detector runs. Deviation, HF noise, correlation, SNR, PSD, and RANSAC all read `EEGData`/`EEGFiltered`, so they all see the re-referenced data; `raw_mne` is untouched.

The subtracted reference (one row) is kept. `find_bad_by_correlation` filters it with the same filter and adds it back per window for the dropout test only. The filter is linear and negation is exact in floating point, so a zeroed stretch is recovered exactly and the existing `MAD == 0` criterion still applies. Dropout windows are excluded from the correlation computation, as before.

- Default `False`: no change in behaviour.
- Ignored with a warning when `matlab_strict=True` (same pattern as `reject_by_annotation`).
- With fewer than 2 usable channels, a warning is logged and no reference is applied (a single channel referenced to itself would be all zeros).
- New entry in the MATLAB differences page under "PyPREP-Only Features"; changelog entry.

## Tests

Flat/NaN still detected and `EEGData` equals the usable channels minus their own mean; a dropout is still detected with `average_reference=True` (fails without the add-back); results independent of the content of a manually marked channel; default off; `matlab_strict`; too few usable channels; non-boolean input. Full suite: 68 passed; pre-commit clean; docs build clean with `-W`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aec30dc77b39`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.