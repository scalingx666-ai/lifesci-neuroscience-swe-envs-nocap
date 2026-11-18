# Issue

**Title:** Detect dropouts below 1e-15 V instead of requiring an exact zero

## Description

Stacked on #217 (contains its commits; review the last commit, or merge #217 first and this will show only its own change).

## Why

`find_bad_by_correlation` counts a window as a dropout only if the MAD of the filtered signal is exactly `0`. Any filtering before or inside `NoisyChannels` leaves residue in a flat stretch:

- the default `do_detrend=True` high-pass alone: ~1e-21 V; only ~9 of ~30 dropout windows stayed exactly zero in a synthetic test,
- a typical 1 Hz high-pass + 100 Hz low-pass + notch chain before `NoisyChannels`: up to ~3e-15 V, **0** windows exactly zero, so `bad_by_dropout` never triggers.

The existing `test_bad_by_dropout` passes only because it uses `do_detrend=False`.

## What

- A window is flat for a channel if the MAD of its filtered signal is below `1e-15` V, the same value as the default `flat_threshold` of `find_bad_by_nan_flat`. Signal MAD in EEG is ~1e-6 V, so the margin is about nine orders of magnitude.
- `matlab_strict=True` keeps the exact-zero criterion.
- Documented as a deliberate difference in the MATLAB differences page and in the method docstring; changelog entry.

Measured on synthetic data (30 s dropout, 1 Hz HP + 100 Hz LP + 50/100/150 Hz notch, DC offsets 0–300 mV): 16–20 of 28 dropout windows flagged (windows at the dropout edges contain filter ringing and are not flagged), i.e. far above the default `frac_bad=0.01`.

## Tests

- A dropout is detected with the default `do_detrend=True` (fails on `main`).
- A stretch of 1e-17 V noise counts as a dropout by default (fails on `main`) but not with `matlab_strict=True`.

Full suite: 71 passed (including the MATLAB comparison tests); pre-commit clean; docs build clean with `-W`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6462354b9af2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.