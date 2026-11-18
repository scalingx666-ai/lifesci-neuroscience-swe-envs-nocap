# Issue

**Title:** Write out T2* & S0 variance + T2*-S0 covariance

## Description

.

Changes proposed in this pull request:

- Retain variance and covariance estimates from nonlinear curve fit when `--fittype curvefit` and `--verbose`.
- Generate figures for these new maps.
- Restructure fit_decay:
    1. Estimate t2s_full and s0_full, but not t2s_limited and s0_limited, in fit_decay/fit_decay_ts.
    2. Create new function to create the limited maps from the full maps and apply the ceilings and floors.
    3. Use masked arrays in fit_decay/fit_decay_ts instead of masking internally.
    4. Delete more variables when we're done using them to hopefully free up memory.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4c4c99d8284f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.