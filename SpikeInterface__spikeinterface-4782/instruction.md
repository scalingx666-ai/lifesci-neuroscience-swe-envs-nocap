# Issue

**Title:** Speed up Wobble peak search with a linear maximum filter

## Description

Wobble calls `argrelmax` with `order=num_samples - 1` during chunked matching. When candidates remain, SciPy rescans the objective for each offset. So this uses two directional `maximum_filter1d` passes while preserving strict maxima; arrays with NaN keep the original path.

Five measured alternating baseline/candidate pairs on generated recordings; the VM harness discarded one setup run:

| Public path | Fixture | Result |
|---|---|---:|
| Matching | 384 channels, 192 templates | 17.932 → 15.581 s (**13.11%**) |
| Cold Lupin sort | 180 s, 64 channels, 20 units; Intel Cascade Lake VM | 120.448 → 106.845 s (**11.29%**) |

The baseline spent 14.76% of matching time in 308 `argrelmax` calls.

The matching pairs were stable (+11.01–14.45%) and returned the same 28,043 spikes byte for byte. The full-sort pairs were also stable (+10.48–13.11%).

Final-code validation: 700 differential cases; ten byte-identical fixed-template runs; 9 focused tests; the public Wobble test; and formatting. Diff: 88 additions, 5 deletions.

The cold-sort result is corroborating, not equal-workload, because clustering is non-deterministic. The 384-channel full sort remains unvalidated: both arms failed during clustering, before matching, with an unknown singular-matrix cause. No captured recording was benchmarked.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `626f70aaef7c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.