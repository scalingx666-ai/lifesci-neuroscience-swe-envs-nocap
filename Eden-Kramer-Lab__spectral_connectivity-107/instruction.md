# Issue

**Title:** Canonical coherence: SVD fallback where Gram whitening drops a real direction

## Description

## Summary

#105 replaced the SVD in `canonical_coherence` whitening with a Gram-matrix `eigh` (CuPy's `svd` loops bin by bin above 32). Forming the Gram matrix squares the condition number, so a weak but **real** direction with singular value below about 1e-7 of a group's largest was dropped as collinear. Invertible within-group mixing (which leaves the true canonical coherence unchanged) with condition number 1e7–1e8 changed the value by **0.003–0.66**; simulated volume conduction (32 channels from 4 sources, sensor noise 1e-6) was off by 0.31.

Fix: bins where the Gram step drops a direction are recomputed with an SVD at the standard `eps * max(n, m)` rank threshold. The SVD is of the n×n R factor of `Aᴴ = QR`, which CuPy batches for groups up to 32 signals (6× faster than an SVD of A on the GPU; equal to 4e-15). Normal data never takes the fallback; dead, exactly duplicated, and common-average-referenced channels are still dropped.

## Accuracy

Sweep against an exact ground truth (the unmixed group): group sizes 2–64, observations 1–10× signals, mixing condition 1–1e8, CPU and GPU.

| | before | after |
|---|---|---|
| condition ≤ 1e6 | ≤ 2e-12 | ≤ 2e-12 |
| condition 1e7–1e8 | up to 0.66 | ≤ 4e-9 |
| volume conduction, noise 1e-6 | 0.31 vs SVD | 3e-10 vs SVD |

Tradeoff: a channel differing from another only by float32 rounding is now kept as a real direction, as the original SVD did (0.290 vs 0.260 without the duplicate). No threshold distinguishes rounding from a real tiny signal; this follows the textbook numerical rank.

## Speed (best of 3; A100 / CPU with 8 threads)

| case | GPU master → this | CPU master → this |
|---|---|---|
| normal data, 4 groups of 4 `(30,10,5,1000,16)` | 0.32 → 0.31 s | 1.52 → 1.53 s |
| normal data, 2 groups of 40 `(10,10,5,500,80)` | 5.54 → 5.54 s | 3.58 → 3.60 s |
| duplicated channel, 4 groups of 4 | 0.32 → 1.21 s | 1.51 → 1.73 s |
| duplicated channel, 2 groups of 40 | 5.5 → 14.6 s | 3.6 → 5.0 s |

A group with a dependent channel takes the fallback at every bin; above 32 signals CuPy's SVD of R still loops per bin (still well below the 37.8 s before #105).

## Test plan

- [x] New `test_canonical_coherence_is_invariant_to_ill_conditioned_mixing` (condition 1e8, groups of 2 and 16): fails on master, passes here
- [x] CPU: 1786 passed, 15 skipped; GPU (`CUDA_VISIBLE_DEVICES=3`): 1770 passed, 31 skipped
- [x] Doctests: 67 passed on each backend
- [x] ruff format/check, mypy clean

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01PBZdURGgoGW24tYeJw67vh

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c6c76f978d37`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.