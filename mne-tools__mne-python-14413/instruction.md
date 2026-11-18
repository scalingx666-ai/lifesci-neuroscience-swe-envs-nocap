# Issue

**Title:** FIX: Convert array-like inputs in eyetracking Calibration

## Description

### summary

the docstring of `Calibration` says `positions`, `offsets` and `gaze` are `array-like`, but if you passed python lists or tuples they stayed as lists. because of this, `cal.plot()` crashed on `assert isinstance(self["positions"], np.ndarray)`.

### changes

- in `Calibration.__init__`, convert `positions`, `offsets` and `gaze` to numpy arrays with `np.asarray(..., dtype=float)` when they are not `None`.
- in `Calibration.plot()`, replaced the bare assertion with a `ValueError` that checks `positions` and `gaze` are 2d arrays.
- added list-input parametrization and a check that `plot()` runs, in `test_create_calibration`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1084a083526f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.