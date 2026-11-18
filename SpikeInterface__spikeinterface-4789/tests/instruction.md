# Issue

**Title:** Avoid dense waveform allocation when exporting PC features

## Description

`export_to_phy()` computes PCA features by default, but currently gathers a dense `(spikes, samples, recording_channels)` waveform array before processing one channel at a time. This change uses a zero-copy sliding window and gathers only the waveforms needed by each PCA channel. In the benchmark below, this removes a 276 MiB temporary per worker for the busiest 1 s chunk.

The dense gather was introduced in #4488. This keeps its per-channel batched transform and only changes how waveforms are gathered.

I measured a 384-channel recording with 59,636 spikes and default 1 s chunks on a fresh 8-vCPU Linux VM. Results are medians of five alternating runs after warm-up:

| `n_jobs` | Time before | Time after | PSS before | PSS after |
| ---: | ---: | ---: | ---: | ---: |
| 1 | 4.208 s | 2.136 s | 934.9 MiB | 664.5 MiB |
| 4 | 1.473 s | 0.859 s | 1,898.4 MiB | 838.3 MiB |
| 8 | 1.420 s | 0.839 s | 3,136.8 MiB | 1,052.4 MiB |

On the public 384-channel SpikeGLX fixture, the default cold route including PCA fitting reduced peak RSS from 669.7 to 558.0 MiB; its timing was noisy, so no speed claim is made. Dense analyzers also benefit: with 38,323 spikes and `n_jobs=1`, median export time went from 11.802 to 9.371 s.

All paired exports produced the same complete `pc_features.npy` SHA-256. An independent per-spike oracle had maximum absolute error `3.58e-7`; the principal-component and Phy-export tests pass with 17 tests, and Black is clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e094b5e3656c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.