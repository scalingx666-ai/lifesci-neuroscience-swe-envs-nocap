# Issue

**Title:** Support GPU acceleration for decay fitting

## Description

Closes none.

Changes proposed in this pull request:

- Add `--backend` parameter to tedana and t2smap, with `cpu`, `cuda`, and `auto` options. `auto` will use a GPU if one is available, and otherwise default to CPU processing.
- Add `gpu` optional dependency group, which installed cuda.


Results from benchmark using the first few subjects of the PAFIN dataset (5 echoes):

Fit-only timings use the full fMRIPrep brain mask after tedana adaptive masking. They exclude DataLad retrieval, NIfTI decompression, mask generation, and log-linear initialization.

## Full-mask CPU vs CUDA

| Subject | Task | Brain voxels | Fitted voxels | Volumes | CPU (s) | CUDA (s) | Speedup | Max ΔT2* (s) |
| --- | --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| sub-20188 | bao | 206569 | 194723 | 243 | 177.37 | 4.19 | 42.37x | 1.38e-06 |
| sub-20188 | rat | 207231 | 195271 | 363 | 190.64 | 5.77 | 33.01x | 1.81e-06 |
| sub-20463 | bao | 193386 | 181719 | 243 | 160.78 | 3.55 | 45.24x | 2.09e-06 |
| sub-20463 | rat | 191807 | 179563 | 363 | 170.92 | 4.93 | 34.70x | 2.64e-06 |
| sub-20828 | bao | 180516 | 170186 | 243 | 161.26 | 3.35 | 48.10x | 6.54e-06 |
| sub-20828 | rat | 180232 | 169257 | 363 | 169.66 | 4.28 | 39.68x | 9.18e-05 |
| sub-20966 | bao | 178243 | 169271 | 243 | 160.20 | 3.85 | 41.66x | 2.99e-05 |
| sub-20966 | rat | 178071 | 167648 | 363 | 162.23 | 4.88 | 33.28x | 7.20e-04 |
| sub-20968 | bao | 197942 | 185600 | 243 | 170.64 | 4.35 | 39.18x | 1.31e-06 |
| sub-20968 | rat | 194892 | 191033 | 363 | 200.80 | 8.42 | 23.86x | 4.85e-04 |

CUDA speedup distribution across 10 runs: median 39.43x, range 23.86x–48.10x.

## CPU worker scaling

| Threads | Fit time (s) | Speedup vs 1 thread |
| ---: | ---: | ---: |
| 1 | 188.19 | 1.00x |
| 2 | 104.95 | 1.79x |
| 4 | 58.84 | 3.20x |
| 8 | 36.86 | 5.11x |
| 16 | 29.90 | 6.29x |
| 28 | 26.30 | 7.16x |

## Volume-wise estimation projection

This extrapolates the median full-mask time for individually fitted sampled volumes to all volumes; it is a model, not a run of the entire `fitmode=ts` workflow.

| Backend | Median seconds/volume | Predicted total |
| --- | ---: | ---: |
| CPU (28 threads) | 19.83 | 80.3 min |
| CUDA | 4.43 | 18.0 min |

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `24e47732ec76`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.