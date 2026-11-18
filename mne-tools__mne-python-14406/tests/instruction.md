# Issue

**Title:** PERF: Vectorize blink interval masking in interpolate_blinks

## Description

### summary

in `_interpolate_blinks()` in `mne/preprocessing/eyetracking/_pupillometry.py`, the blink mask was built with:

```python
mask |= (raw.times >= start) & (raw.times <= end)
```

and this ran for every blink annotation on every channel. on a long eye-tracking recording (100,000+ samples, hundreds of blinks, several pupil/gaze channels) that adds up to O(C × B × N) elementwise comparisons and full-array ors, which is a clear cpu bottleneck.

### changes

1. work out the sample boundaries once, outside the channel loop, with `np.searchsorted`:
```python
   start_indices = np.searchsorted(raw.times, starts, side="left")
   end_indices = np.searchsorted(raw.times, ends, side="right")
```
2. set the mask with a plain slice per blink, `mask[s_idx:e_idx] = True`, instead of the full-array broadcast.
3. skip interpolation when `len(blink_indices) == 0`.
4. added `test_interpolate_blinks_synthetic` in `test_pupillometry.py`. it covers pupil/gaze selective interpolation, buffer boundaries and channel filtering.

### benchmark

100 s recording at 1000 Hz, 200 blinks, 4 channels:

- before: ~125 ms
- after: ~1.2 ms (~100x faster)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `eb845cd1713d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.