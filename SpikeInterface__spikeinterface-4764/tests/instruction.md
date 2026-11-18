# Issue

**Title:** perf(postprocessing): compute only the amplitude scaling coefficients

## Description

`amplitude_scalings` calls `linregress` per ordinary spike and creates a `LinearRegression` per collision, although only the fitted coefficients are used. This computes unused statistics and repeats estimator validation inside the per-spike loop.

This change computes the ordinary slope directly from centered covariance/variance in float64, and calls `scipy.optimize.nnls` directly for collisions. The float64 accumulation avoids the SciPy-version-dependent float32 rounding found during validation, while the collision path keeps the same intercept and non-negative constraint.

On a 384-channel, 200-unit, 120-second analyzer with 191,674 spikes (`n_jobs=1`), the public pipeline that feeds `valid_unit_periods` went from 110.224 s median (107.983–111.503) to 45.757 s (45.666–45.815), or 2.41x. The 191,674 scalings and collision flags were bit-identical. A public Spike2 recording with 23,096 events and 2,140 collision fits went from 9.386 s to 1.017 s (9.23x), also bit-identical. The focused tests pass, 9 of 9.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f28aa212db1d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.