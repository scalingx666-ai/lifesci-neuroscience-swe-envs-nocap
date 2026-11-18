# Issue

**Title:** Use channel offsets, not gains, when scaling amplitudes to uV

## Description

`SpikeAmplitudeNode` and `AmplitudeScalingNode` read the channel **gains** into their offset array, so with `return_in_uV=True` (the default) they return `raw * gain + gain` instead of `raw * gain + offset`:

```python
self._gains = recording.get_channel_gains()
self._offsets = recording.get_channel_gains()   # should be get_channel_offsets()
```

Every amplitude is therefore off by exactly `gain - offset` µV. On an Intan `.rhd` recording (`gain=0.195`, `offset=-6389.76`) that is **+6389.955 µV** on spikes whose true amplitude is about -46 µV, which also flips their sign; on a zero-offset recording such as SpikeGLX (`gain=2.34375`) it is a constant **+2.34 µV** on every spike.

Measured over 1443 spikes of a generated ground-truth recording, comparing each amplitude against `recording.get_traces(return_in_uV=True)` at the exact sample and channel that amplitude is taken from:

| recording | error before | error after | median amplitude before → after (trace value) |
|---|---|---|---|
| Intan-like, gain 0.195, offset -6389.76 | +6389.955 (constant) | 2.6e-04 | +6344.325 → -45.630 (-45.630) |
| per-channel gains and offsets | +5130.045 … +6933.117 | 5.9e-04 | +5363.440 → -45.555 (-45.555) |
| SpikeGLX-like, gain 2.34375, offset 0 | +2.34375 (constant) | 0.0 | -42.188 → -44.531 (-44.531) |

`amplitude_scalings` passes the scaled waveform to `linregress` and keeps only the slope, so a uniform offset is absorbed by the intercept and the scalings do not move. When gains and offsets vary per channel the shift is not uniform and the median scaling goes from 2.5162 to 1.0018.

The scaling was correct before the node-pipeline refactor in d3ac13f1b, which replaced `recording.get_traces(..., return_scaled=return_scaled)` with the inline expression. Of the seven places outside tests that populate an offset, the other five all call `get_channel_offsets()`.

Test suites on Linux / Python 3.12: `postprocessing` 97 passed 40 skipped, `metrics` + `exporters` 58 passed, `curation` + analyzer core 98 passed 1 skipped. Not run on macOS or Windows, and not on 3.10 / 3.13.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f03253e9c7ed`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.