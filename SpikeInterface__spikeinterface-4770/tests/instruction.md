# Issue

**Title:** Correct and speed up multi-segment synchrony metrics

## Description

### Description

Synchrony metrics can credit the wrong units when a sorting has multiple segments. Equal sample indices from different segments get grouped together, and the code then slices the spikes as if those occurrences were contiguous. That can mark solitary units as synchronous, and it can also miss units that belong to a real synchronous event.

The spike vector is already ordered by segment and sample, so this change just detects the adjacent events and counts the unit pairs with NumPy instead. Single-segment results, duplicate-unit behaviour, and the ordering through the supported `periods` path stay the same, and it adds no dependency. This is the synchrony bottleneck discussed in #4310, and it follows the ordering contract from #4606.

### Benchmark

I measured this through `compute_synchrony_metrics`, one thread, median of five fresh-process runs after warm-up:

| Workload | Before | After | Speedup |
|---|---:|---:|---:|
| 20M spikes, 400 units; Xeon 8481C | 5.777 s (5.772–5.954) | 0.654 s (0.648–0.655) | 8.84x |
| #4310 proxy: 5M spikes, 1,000 units, 1,000 s; Arm Altra | 2.647 s | 0.250 s | 10.58x |

Peak RSS on the 20M-spike workload dropped from 1051.7 to 315.7 MiB, and the output hashes matched in both workloads.

### Validation

I ran the quality-metrics module: 32 tests pass. The patch also matches an independent oracle across 400 randomised multi-segment cases and the public MEArec fixture. Black is clean, and I tested it on Linux.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `80beb9351a7f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.