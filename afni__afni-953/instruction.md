# Issue

**Title:** 3dTstat: fix -DW denominator, -tdiff detrend conventions, -nzmean NaN

## Description

.

1. **METH_DW**: seed the denominator with `ts_det[0]*ts_det[0]` instead of the raw `ts[0]*ts[0]`, so DW = Σ(Δe)²/Σe² is computed entirely on the detrended residuals. Synthetic verification: baseline-1000 series with true DW 0.56 previously reported 7e-6.

2. **`-tdiff`**: convert `get_linear_trend()`'s (intercept-at-0, slope-per-index) output into the MAKER convention the downstream code expects: `ts_mean = f0 + f1·L/2` (the fitted line's value at the center index, which for least squares equals the sample mean) and `ts_slope = f1/tdelta` (tdelta is forced nonzero by the MAKER). Verified numerically: the removed trend now equals the least-squares line exactly, and `ts_mean` equals the sample mean.

3. **METH_NZMEAN**: guard the division with `nzpts > 0` instead of `npts > 0`, so all-zero voxels output 0 rather than NaN.

Compiles cleanly with `-Wall`. (The sub-brick label buffer overflow noted in the same file has already been fixed on master — `tmpstr[42]`.)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `515e7d91a58b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.