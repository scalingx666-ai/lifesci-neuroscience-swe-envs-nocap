# Issue

**Title:** BUG: Fix fNIRS `interpolate_bads` on `Epochs`

## Description

## Reference issue (if any)

None.

## What does this implement/fix?

Fixes `Epochs.interpolate_bads()` index axis error for fNIRS 'nearest' interpolation.

`_interpolate_bads_nirs()` copied the donor channel with `inst._data[bad_raw_idx] = inst._data[closest_raw_idx]`. This works with 2d Raw `(channels, times)` data, but not with `Epochs` `(n, channels, times)`. Every other interpolation method in the same file already indexes the channel axis from the end.

```python
inst._data[..., bad_raw_idx, :] = inst._data[..., closest_raw_idx, :]
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8f0ad6bf3d17`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.