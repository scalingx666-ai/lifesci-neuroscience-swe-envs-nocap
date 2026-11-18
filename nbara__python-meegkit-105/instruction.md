# Issue

**Title:** [ENH] ASR: build clean_windows sample mask without quadratic concat

## Description

## Summary
The set of samples to drop in `clean_windows` was accumulated by repeatedly
concatenating per-window index ranges with `np.r_[...]` inside a loop. This
reallocates a growing array on every removed window (O(k²) in the number of
removed windows) and materialises a large index array before `np.unique` /
`np.delete`.

Mark the samples to remove directly in a boolean mask of length `n_samples`
instead. This is O(n_samples), allocates once, and drops the
`np.unique`/`np.delete` round-trip. `X` is returned untouched (no copy) when
nothing is removed, matching the previous behaviour.

## Correctness
`clean` and `sample_mask` are bit-identical on the test data.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3e66fb1e85dc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.