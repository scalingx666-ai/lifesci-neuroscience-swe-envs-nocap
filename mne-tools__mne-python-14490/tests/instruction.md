# Issue

**Title:** Speedup MEG and EEG channel mapping

## Description

A few simple changes to speed up `autoreject` a bit more (~17s to ~14s in local testing):

1. Skip coil geometry computation if it's not needed (like when interp data has already been computed)
2. Use `set` rather than `np.unique`
3. Vectorize channel location check (`autoreject` sets a lot of them so the loop overhead becomes costly)
4. Allow actually using `n_jobs` in `compute_interpolation_data`
5. Speed up `pick_types` by avoiding a `bool-ndarray`->`ch_names-strs`->`pick_channels`->`ndarray-of-int` path, going straight from `bool-ndarray`->`int-ndarray`

Changes drafted with Claude Opus 5.5 and reviewed by me.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `823da93af9b9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.