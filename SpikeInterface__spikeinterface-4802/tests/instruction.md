# Issue

**Title:** Speed up FFT phase shifts for Neuropixels recordings

## Description

## What this changes

Neuropixels channels reuse a small set of ADC sampling delays, but the current FFT path still computes one phase vector per channel. The real NP 2.0 fixture used here has 16 unique delays across 384 channels.

This computes one rotation per unique delay and gathers it back to the channel layout. The optimised path is limited to inputs with at least 128 samples, 32 channels and 4x average delay reuse. Smaller or less repetitive inputs keep the original path.

The API and numerical expression do not change.

## Benchmark

`BinaryRecordingExtractor -> phase_shift -> common_reference(global median) -> write_binary_recording`, 384 channels, 10 seconds, `n_jobs=1`, one-second chunks. Five alternating runs after one warm-up:

| CPU | before | after | paired speedup | peak RSS |
|---|---:|---:|---:|---:|
| Intel Ice Lake | 9.392 s | 7.742 s | 17.48% | 526.2 -> 479.1 MB |
| AMD Milan | 5.681 s | 4.310 s | 23.88% | 525.8 -> 478.9 MB |
| ARM Altra | 7.687 s | 6.205 s | 19.60% | 524.9 -> 477.7 MB |

The five runs on each CPU produced identical output. The real Open Ephys NP2 fast-path fixture is also byte-identical.

This complements #4563 by speeding up the exact FFT method. If FIR becomes the default, this still helps users who keep the exact path. Cross-chunk caching is left for a separate change.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b17c60f8f620`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.