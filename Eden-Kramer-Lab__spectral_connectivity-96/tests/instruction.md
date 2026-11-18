# Issue

**Title:** Compute the phase-lag moments in one tile pass; add a parity-gated benchmark

## Description

The four phase-lag-index measures (PLI, wPLI, debiased squared PLI, debiased squared wPLI) dominated the default measure set. `Connectivity._imaginary_cross_spectrum_moments` now forms each tile of the per-observation imaginary cross-spectrum once and reduces all four moments from it — a count-based sign moment with an explicit NaN mask, a single-pass `einsum` for the squared moment, reused buffers, loop invariants hoisted — instead of re-forming the tile per requested key. With observation weights (Morlet smoothing), only the requested moments are reduced, which measured faster than computing all four there.

Measured on 2000 samples × 100 trials × 32 signals (case b of the new benchmark): the default set 5.9 → 3.4 s, the four phase-lag measures together 3.9 → 1.4 s; on the weighted path a lone PLI/wPLI is 1.2–1.4× faster. Every default measure is bit-identical to the previous implementation except `debiased_squared_weighted_phase_lag_index`, which differs by summation-order rounding in the squared moment only (≤ 1.4e-17 on the benchmark cases). Two shortcuts were considered and rejected with evidence recorded in the design: taking the linear moment from the cross-spectral matrix (changes wPLI at a 1e-13 rad lag) and count-based signs without an `isnan` mask (drops NaN observations).

`benchmarks/bench_default_measures.py` times the transform, each default measure, and the default set on two fixed cases, and its `--save`/`--compare` pair gates output parity at 1e-12; documented in CLAUDE.md. Tests pin NaN propagation, the exact ±1 at a tiny constant lag on both paths, the weighted definition at 1e-12, the reference definition under all seven averaging modes, one-pass computation, failure recovery, the partial last block, and the emulated-device path. Follow-up recorded: a signal-axis-first tile layout would cut tile formation ~8× more.

Phase 7 of #89; stacked on #95 (retarget to `master` after it merges). Gate green locally: ruff, mypy, 67 doctests, 1649 passed / 13 skipped, parity PASS.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e63286039746`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.