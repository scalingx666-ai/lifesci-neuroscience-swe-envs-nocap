# Issue

**Title:** BUG: Fix fNIRS `interpolate_bads` with missing channel positions

## Description

## Reference issue (if any)

.

## What does this implement/fix?

For bad fNIRS channels without positions (NaN or all zero), `interpolate_bads` warns that their values "will be all NaN", but `_interpolate_bads_nirs` copied another channel instead. For NaN, `np.argmin` over the distances returns the first NaN index. For all zero, the nearest channel to the origin is copied.

`_interpolate_bads_nirs` now:

1. sets bad channels without positions to NaN, as the warning says,
2. never picks good channels without positions as donors,
3. raises `ValueError` when no good channel with a position is left.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `24c3922e8a31`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.