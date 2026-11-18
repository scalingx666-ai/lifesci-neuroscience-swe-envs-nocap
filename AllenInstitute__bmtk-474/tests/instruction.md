# Issue

**Title:** Accelerate NEST execution and document experimental training limitations

## Description

## Summary

Add NEST-specific fused CUDA state updates and separate FP16 spike outputs from the FP32 voltage penalty, reducing execution time and memory use.

**NEST training remains experimental and is not recommended. Use legacy dynamics for training.** Matched V1 runs show excitatory-rate collapse with both fused and unfused NEST. This PR does not resolve that failure. NEST inference requires separate validation.

## Changes

- Add NEST forward/backward kernels and reduce saved-state transfers.
- Preserve mixed output/state dtypes and checkpoint replay across Keras 2/3.
- Add regression tests and explicit training warnings.
- Keep legacy dynamics and acceleration defaults unchanged.

Rebuild CUDA operators before enabling NEST fused state. Compact direct-cell output now returns `(spikes, voltage_penalty)`; the high-level extractor interface is unchanged.

## Performance and Validation

Matched RTX 3090 benchmark, effective batch 32, default TensorFlow memory optimization and `cuda_malloc_async`:

| Path | Median update | Peak allocation |
|---|---:|---:|
| NEST | 4.55 s | 10.60 GiB |
| Legacy | 4.36 s | 10.61 GiB |

These are execution measurements, not convergence qualification.

Tests passed: 496 CUDA, 309 CPU fallback, and 309 Python 3.8/Keras 2. No numerical tolerances were relaxed. GitHub CI and review remain required.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c17ca9cd22ef`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.