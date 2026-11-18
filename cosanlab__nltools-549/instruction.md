# Issue

**Title:** fix: hygiene sweep slice F — ISC and bootstrap inference

## Description

Slice S-F of the 0.6.0 hygiene sweep (#535): inference — ISC, intersubject, bootstrap, RNG and inference utilities. Every finding was reproduced before it was fixed; each behavioural change carries the test that failed on master.

Findings fixed (ids from the #535 tracker): F-01, F-02, F-03, F-04, F-05, F-06, F-07, F-08, F-09, F-10, F-11, F-13, plus the `isc()` p-value shape the verifier found.

Behavioural:
- ISC on a constant subject no longer yields the smallest p-value the correction can produce; undefined draws are excluded from the p-value denominator and the interval, and `return_null=True` hands back every draw with `NaN` where it was undefined.
- A singleton voxel axis gives the same p-value as the 2-D call; `isc()` returns `p` as a float for 2-D input, matching `isc` and `ci`.
- The value-based self-correlation mask is gone on both the pairwise and group paths, so a genuine −1 correlation and a duplicated-subject pair are told apart by identity.
- The ISFC parallel worker accumulates in float64, so `n_jobs=1` and the default `n_jobs=-1` agree on integer input; 3-D phase randomisation and the Euclidean fast path no longer truncate or overflow integer dtypes.
- Group bootstrap validates that both groups share a voxel count instead of broadcasting a one-voxel group.
- The ridge bootstrap plans workers from the design and the target together, the preflight charges the index matrix, and the CPU engines stop pickling every index array into every worker.
- `_BootstrapAccumulator.merge` no longer raises on a latent index error.

Mechanical: one dead test helper removed; one shared `_summarize_isc_values` for observed and surrogate ISC; `development/inference-internals.md` describes the resampling changes.

Migration rows: three (constant-subject p-values, singleton-axis p-values, the identity-based self-correlation mask).

Gates: `uv run poe ok` after rebase onto 5e7e3b2f, the touched test files at `-m ''`, strict docs build.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9ceba159b439`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.