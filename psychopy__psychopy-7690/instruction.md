# Issue

**Title:** BF: fix removed np.NaN and broken NaN check in iohub eye tracker parser

## Description

## Summary

`EyeTrackerEventParser.getSampleEventCategory` (and `_calculateAdaptiveVThresholds`) use `np.NaN`, which was **removed in NumPy 2.0**. Since `dev` now officially supports Python 3.12 / NumPy 2 (and the lockfile resolves NumPy ≥ 2.2), reaching the line raises `AttributeError` for **every valid eye sample**, breaking event parsing entirely under NumPy 2:

```
AttributeError: `np.NaN` was removed in the NumPy 2.0 release. Use `np.nan` instead.
```

There is also a latent **logic bug** independent of the NumPy version: `x_velocity_threshold == np.NaN` is always `False` (a NaN never compares equal to anything), so the guard meant to discard samples with a missing position never fired.

## Fix

- `parser.py:312` — `if x_velocity_threshold == np.NaN:` → `if np.isnan(x_velocity_threshold):` (fixes both the crash and the never-firing guard)
- `parser.py:443` — `vthresh_values.append(np.NaN)` → `vthresh_values.append(np.nan)` (sentinel, crash only)

## Tests

Adds `psychopy/tests/test_iohub/test_eyetracker_parser.py` — a hardware-free unit test that stubs the parser's `io_event_ix`/`isValidSample` callables and exercises `getSampleEventCategory`:

- a NaN-position sample is now discarded (returns `None`)
- a normal sample is categorised without raising (`FIX`/`SAC`)
- an invalid sample is reported as `MIS`

Verified the first two tests fail on the current code with the `np.NaN` `AttributeError` and pass with the fix.

Part of the ongoing Python 3.12 / NumPy 2.0 migration (see the stalled #6744) — this is one of the residual `np.NaN`/`np.unicode_` removed-alias uses left in the tree.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4d550dcd63a0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.