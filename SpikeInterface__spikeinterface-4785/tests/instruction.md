# Issue

**Title:** Speed up template similarity with pair-level parallelism

## Description

Template similarity currently parallelizes over source rows. A common soft merge compares one new template with hundreds of targets, but exposes only one parallel task.

This flattens connected `(source, target, active_channels)` pairs into typed lists and runs `prange` over them. For a square matrix, row `i` has `N - i` pairs, so pair-level scheduling also balances work better than complete rows. Support selection, cosine/L1/L2 arithmetic, lag symmetry and disconnected-pair behavior stay unchanged.

I ran five paired fresh-process workflows after one warm-up on a GCP `c3-standard-8` (Xeon Platinum 8481C, 8 vCPUs), with 256 units, 384 channels and 20 public soft merges.

| Workflow | Baseline median (range) | Candidate median (range) | Change |
| --- | ---: | ---: | ---: |
| Complete setup + 20 soft merges | 17.767 s (17.323-17.844) | 12.771 s (12.682-12.848) | **-28.1%** |
| Initial template similarity (fresh process, includes JIT) | 11.585 s (11.116-11.634) | 9.644 s (9.574-9.699) | **-16.8%** |
| Median soft merge | 227.2 ms (224.8-229.3) | 73.6 ms (73.5-73.6) | **-67.6%** |

The complete workflow includes imports, analyzer setup, template calculation and JIT compilation. Every paired run improved by 26.3-28.4% and returned the same checksum.

On the public 10-second MEARec fixture, five warmed soft merges went from 6.17 ms to 2.42 ms, with exactly equal complete matrices. A separate 300-case sweep matched NumPy across all metrics and support modes, sparsity and varied shifts. The complete template-similarity module has 19 passing tests, the dense/sparse extension merge test has 2 passing cases, and Black is clean.

Related to #4310.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d838c3d9bb4c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.