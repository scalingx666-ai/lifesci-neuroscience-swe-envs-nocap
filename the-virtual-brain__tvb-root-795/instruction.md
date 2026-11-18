# Issue

**Title:** backend: re-port #784 chunk_size fix (drop horizon cap, per-chunk noise)

## Description

## What this is

A hand re-port of community PR #784 ("Chunksize fix", author **i-Zaak**) onto current `master`.

#784 is still open but unmergeable: its base is the old `hybrid-numba` monolith, whose merge-base with `master` is 2026-05-13 (before the hybrid subsystem was split out), so a direct merge conflicts in ~20 files. Rather than merge that branch, this PR re-applies its *semantics* on top of current `master`, incorporating owner review suggestions and adding the missing test coverage.

## Credit

Original implementation by **i-Zaak** in PR #784:

- removes the `chunk_size > min projection horizon` guard in `_run_compiled`;
- replaces the full-run pre-allocated noise array with per-chunk generation;
- changes the template noise indexing accordingly;
- replaces `test_rejects_chunk_size_gt_horizon` with a chunk-size equivalence test.

## Changes

### 1. Relaxed, not removed, the horizon guard
The old `ValueError` firing on `chunk_size > min horizon` is replaced by a weaker sanity check that still fails loudly on genuinely broken configs: for every projection it verifies

```
horizon >= max(idelay) + 1
```

This is the modulo-wrap invariant that makes `chunk > horizon` safe. The delayed-coupling history buffer is addressed by the *global* step modulo the buffer length, and is written **after** it is read within a step (read-before-write), so correctness does not depend on how many steps a chunk spans — a chunk may cross a delay horizon, and several chunk boundaries may map onto the same modulo slots. The cap existed only because the old noise array was indexed by the global step.

Rationale (safety): a violated invariant would alias two distinct delays onto the same buffer slot and silently corrupt coupling, so that case keeps a loud failure. The chunk-size cap itself is removed because the buffer math does not depend on chunk size.

### 2. Per-chunk noise generation
`_run_compiled` no longer allocates an `(nstep, n_var, n_nodes, n_modes)` noise array. It passes the RNG stream and the per-variable noise scale `noise_std = sqrt(2 * nsig * dt)`; the `run_network` template draws a chunk-sized `(this_chunk, n_var, n_nodes, n_modes)` array inside the outer chunk loop.

Rationale (memory): the old full-run array is `O(nstep)` and OOMs for long stochastic runs (the CPU sweep backend is worse — `× n_sweeps`). Peak allocation is now `O(chunk_size)`.

Rationale (performance): chunk size is no longer forced down to the shortest delay horizon, so callers can use large chunks (fewer Python-level outer iterations) even with short-delay projections.

Draw order is preserved across chunk sizes: each chunk draws its steps sequentially in the same `(n_var, n_nodes, n_modes)` order as the old single draw, so a fixed seed gives the same trajectory regardless of `chunk_size`.

### 3. Template noise indexing
Master's template has evolved since #784's base: `network_chunk` takes `t_start`, uses `for t_local in range(nstep)` with `t = t_start + t_local`, and indexes the full noise array by `t - data_offset - 1`. The per-chunk array is now indexed chunk-relatively by `t_local`.

`network_chunk` is **also called by the CPU-sweep template**, which still passes a full-run array keyed to the global step. To leave the sweep path bit-for-bit unchanged, the noise index is selected from the array's actual last-axis length: a chunk-sized array (length == `nstep`) uses `t_local`; a full-run array keeps the global `t - data_offset - 1`.

### 4. Tests
Ported i-Zaak's equivalence test, plus extended coverage (the original's was thin: 1 subnetwork, 3 nodes, horizon 3, nstep 30):

- `test_chunk_size_gt_horizon_is_valid` — `chunk_size=10` vs `chunk_size=1`, final states `allclose` (ported from #784).
- `test_multi_subnet_multi_projection_chunk_gt_min_horizon` — two subnetworks with an inter- and an intra-projection; `chunk_size=12 > min horizon 3`.
- `test_long_delay_crosses_multiple_chunk_boundaries` — `idelay=100` crossing >12 chunk boundaries at `chunk_size=8`.
- `test_rng_stream_identity_across_chunk_sizes` — same seed → stochastic trajectory matches between `chunk_size=1` and `7` within tight tolerance.
- `test_rejects_aliased_delay_horizon` — the retained guard fails loudly when `horizon < max(idelay)+1`.
- `test_rejects_subsample_with_chunk_size_gt_1` is kept intact.

## Out of scope / follow-up

The CPU sweep backend (`nb_hybrid_sweep_cpu.py` and its template) has the same full-run noise allocation — worse, `× n_sweeps` — and is **not** modified here. It should get the same per-chunk treatment in a follow-up. `network_chunk`'s length-based index selection above is what keeps the sweep correct in the meantime.

## Worked on by: i-Zaak (original PR #784)

Owner review direction incorporated: (a) replace the guard with the `horizon >= max(idelay)+1` invariant instead of deleting it; (b) keep RNG draw order identical across chunk sizes; (c) add the extended tests above; (d) leave the CPU sweep backend out of scope and record it as follow-up.

## Validation

Local (`test_nb_hybrid.py` + sweep/backend suites): **104 passed, 3 skipped** (skips are GPU-only tests). Full test suite submitted on the inslurm Slurm cluster for this branch — results to follow.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3d6c5a9c4273`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.