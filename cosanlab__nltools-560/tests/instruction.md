# Issue

**Title:** fix(find_spikes): linearly detrend each voxel before spike detection

## Description

## Problem
`find_spikes` scaled its cutoffs by the SD of the raw global signal (and of the frame differences). With slow scanner drift, that SD is dominated by the drift rather than TR-to-TR noise, so real spikes were missed unless you used very low cutoffs.

Example (64 voxels, 100 TRs, drift of 0→100, +10 spike at TR 50): before this change, `find_spikes(..., global_spike_cutoff=3)` flagged **nothing**; now it flags exactly TR 50.

## Change
- `nltools/algorithms/outliers.py`: new `_detrend_time` helper (`scipy.signal.detrend`, `type="linear"`, in place on the array copy `find_spikes` already makes). It is applied along the time axis in both the `BrainData` path (axis 0) and the NIfTI path (axis 3), before the global mean and frame differences are computed.
- Docstrings for `find_spikes` and `BrainData.find_spikes` now describe the detrending step.
- No signature change.

## On @ejolly's question about already-detrended data
No check is needed, because linear detrending is idempotent: detrending data that is already detrended leaves it unchanged. A test asserts that raw and pre-detrended input produce identical spike regressors.

## Tests
New `TestFindSpikesDetrend`:
- A spike on top of strong drift is detected (NIfTI input).
- A spike on top of strong drift is detected (`BrainData` input, time on axis 0).
- With no spike added, drift plus noise flags nothing (at a 5 SD cutoff, since pure noise crosses 3 SD by chance in about a third of random draws).
- Already-detrended input gives the same result as raw input.
- The caller's `BrainData` is not modified.

With the fix reverted, the three tests that depend on it fail. `uv run poe ok` passes (1240 passed), and so does the slow Simulator-based `find_spikes` test.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a7053202953c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.