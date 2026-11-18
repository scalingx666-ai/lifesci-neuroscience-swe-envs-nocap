# Issue

**Title:** Rescale the waveform view when the waveforms type changes

## Description

Toggling the Waveform View between raw waveforms, mean waveforms, and templates does not rescale the y axis. Because templates and raw traces differ in amplitude by orders of magnitude, whichever type is not the one the view first drew is unreadable, either as flat lines or as traces overflowing their box. Reset scaling does not help because it only touches box and probe scaling, and the only workaround reported in the issue is restarting the GUI with the desired type already selected.

The cause is in `WaveformView.plot`, which does `self.data_bounds = self.data_bounds or self._get_data_bounds(bunchs)`. `data_bounds` is set to `None` only in `__init__`, so the bounds are computed once on the first plot and then reused for the whole life of the view, including across waveforms type switches. The four entry points that change the type, the `waveforms_type` setter, `next_waveforms_type`, `previous_waveforms_type`, and `toggle_mean_waveforms`, all call `plot` without invalidating those bounds.

The fix adds `_rescale_if_waveforms_type_changed`, which clears `data_bounds` only when the current type actually differs from the previous one, and routes all four entry points through it. `toggle_mean_waveforms` now assigns through the property setter rather than calling `RotatingProperty.set` directly, so there is a single place where the invalidation happens. Bounds are still shared across cluster selections of the same type, so the scale stays comparable while stepping through clusters, which is the existing behavior users rely on.

Tested headlessly with a view holding two waveform types whose amplitudes differ by a factor of 1000. On master, after switching to the smaller type the upper bound stays at 80.126 instead of 0.080126, a relative error of 999, which is the flat-line symptom. With the fix it tracks the displayed type through all four entry points. The new test in `phy/cluster/views/tests/test_waveform.py` fails on master and passes here. `make lint`, `make format-check`, `pytest phy/cluster` (112 passed), and `pytest phy/apps` (139 passed) are all green.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1e56305eb50a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.