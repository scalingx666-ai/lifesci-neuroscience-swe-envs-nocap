# Issue

**Title:** Precompute unit-pair spatial overlap once in find_collisions

## Description

### Description

`find_collisions` (used by `compute("amplitude_scalings")` when `handle_collisions=True`, the default) calls `_are_units_spatially_overlapping(sparsity_mask, i, j)` once per temporally-overlapping spike-pair candidate. That helper recomputes `np.any(sparsity_mask[i] & sparsity_mask[j])` from scratch every time, but the answer only depends on the pair of unit indices — a fixed fact of `sparsity_mask` with at most `num_units**2` distinct values. On a realistic recording this ends up being recomputed millions of times over the course of a run.

This replaces it with `_unit_pair_overlap_matrix(sparsity_mask)`, a single integer matrix multiplication that returns the full unit-pair overlap matrix. Since `sparsity_mask` is fixed for the whole node's lifetime, it's precomputed once in `AmplitudeScalingNode.__init__` (not once per chunk inside `compute()`/`find_collisions`, which is where the matrix multiplication originally landed) and looked up with vectorized fancy indexing instead of a per-candidate Python loop. Same boolean logic, so results are unchanged.

### Performance

Representative public call, `sorting_analyzer.compute("amplitude_scalings", n_jobs=1)`, on a 384-channel/150 s/200-unit ground-truth recording (450,920 spikes, materialized to binary before timing), with `waveforms`/`templates`/`noise_levels` precomputed outside the timed region. Measured on a GCP `c3-standard-8` (Intel Sapphire Rapids), numerical threads pinned to 1, 5 repeats with baseline/patched order alternated, 1 discarded warmup:

| | median | range |
|---|---:|---:|
| Before | 142.351 s | 141.847 – 144.392 s |
| After | 125.011 s | 124.554 – 126.046 s |

Per-repeat speedup: 12.18%, 13.74%, 12.20%, 11.14%, 12.29% (median 12.20%, same sign every time).

### Validation

- Bit-identical: 300 randomized trials (2–40 units, 2–64 channels, both random and explicitly non-contiguous per-unit channel subsets, an empty-sparsity-row edge case) comparing `find_collisions` before/after (precomputed-matrix call included) — 0 mismatches.
- New test `test_unit_pair_overlap_matrix_matches_naive_reference`: checks the overlap matrix against a direct `np.any(mask[i] & mask[j])` reference for every unit pair, including the empty-row case. Fails with `ImportError` on unpatched `main` (function doesn't exist yet), passes on this patch.
- A discriminating mutant (requiring *full* rather than *any* channel overlap) is caught by both the new test and the existing `test_find_collisions_with_margin_indices` (added in #4786).
- Also ran the full public path end to end (`compute("amplitude_scalings", handle_collisions=True)`, real 18,027-scaling output) before/after — bit-identical.
- Full postprocessing suite: 123 passed, 44 skipped, no regressions.
- `black`/style clean; no collision with the open draft PR touching this file (#4708, unrelated import only).

Tested on Linux only (no macOS/Windows access here); the change has no platform-dependent code path, and this module is already covered by the ubuntu/macOS/Windows × py3.10/3.13 CI matrix. The overlap matrix is `num_units x num_units`, so memory grows quadratically with unit count — negligible here (~500 KB at 200 units) but worth knowing about at extreme unit counts (~500 MB at 10,000 units).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `10a6e750462b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.