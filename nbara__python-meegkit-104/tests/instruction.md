# Issue

**Title:** perf(asr): compute windowed RMS via cumulative sum

## Description

## Summary
`clean_windows` and `asr_calibrate` estimate a per-channel windowed RMS
amplitude over fixed-length, overlapping windows. Both did this with a Python
loop that re-summed each window from scratch (`np.sum(x[o:o + N])` per offset),
which is O(n_samples × n_windows).

Since every window has the same length `N`, each windowed sum of squares is a
difference of a running cumulative sum. Replacing the loop with a single
`np.cumsum` over all channels makes this O(n_samples) and vectorises across
channels. In `asr_calibrate`, `np.abs(V.T @ X)` is folded into `(V.T @ X) ** 2`
since the value is only ever squared.

## Impact
`clean_windows` (45 s, 8 ch) ~134 → ~87 ms (best-of-5).

## Correctness
- `clean_windows` output is bit-identical on the test data.
- The `asr_calibrate` windowed RMS matches the previous computation to ~1e-13
  (cumulative-sum rounding), far below any level the downstream distribution
  fit is sensitive to.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `02db7a1842e4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.