# Issue

**Title:** [ENH] ASR: vectorise fit_eeg_distribution grid search

## Description

## Summary
`fit_eeg_distribution` dominates ASR calibration: it runs once per channel (and
per rotated component), and its grid search builds a per-column histogram at
every grid step. Two hot spots are vectorised.

1. The quantile-interval matrix `newX` was filled row by row in a Python loop of
   fancy-index gathers; this becomes a single gather
   `X[rows[:, None] + cols[None, :]]`.
2. Inside the grid loop the histogram of each column was computed with a
   separate `np.histogram` call. The bins are the fixed integer edges
   `[0, 1, ..., nbins]` and the column values lie in `[0, nbins]`, so a single
   `np.bincount` reproduces every column at once. `H >= 0`, so `astype(int)` is
   a floor and matches np.histogram's half-open bins; clipping the top index to
   `nbins - 1` reproduces its inclusive final edge.

## Impact
`fit_eeg_distribution` (fine-grid regime) ~23 → ~13 ms/call (~1.8×).

## Correctness
- Bit-identical parameter estimates on the test data.
- The vectorised histogram matches `np.histogram` exactly over 3000 random
  matrices whose values land on bin edges.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3c1e2e96a20a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.