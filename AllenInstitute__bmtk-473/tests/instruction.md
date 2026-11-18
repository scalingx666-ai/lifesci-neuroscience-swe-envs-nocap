# Issue

**Title:** Add opt-in NEST-compatible GLIF dynamics to DPointNet

## Description

## Summary

Adds opt-in NEST-compatible GLIF dynamics for compatibility studies and validation. **Legacy remains the default and the throughput-oriented starting point for training and inference.** Existing acceleration defaults remain unchanged.

Scientific dynamics changes are kept separate from the previously merged CUDA performance work.

## Changes

- NEST-compatible refractory timing, exact alpha-current-to-voltage integration, time-averaged adaptation, and spike-boundary adaptation reset.
- SONATA initial voltage/adaptation state and recurrent/external delays.
- Explicit heterogeneous recurrent state and external delay history across temporal chunks.
- End-of-step spike and voltage timestamps in NEST mode.
- Rejection of incompatible cached-state layouts.
- Training-reset safeguards, regression tests, and configuration documentation.

## Configuration and Compatibility

Select `dynamics_mode="nest"` explicitly when NEST-aligned behavior is required.

NEST requires `use_fused_state=false`: the existing fused-state kernel implements legacy equations. **Fused CUDA synaptic currents and other qualified accelerators remain available.**

Changing dynamics can change trajectories and learned weights. This is not a transparent replacement for legacy execution or a guarantee of full-network equivalence with NEST.

## Training Reset Safety

The safeguard deliberately affects **both legacy and NEST GLIF training**:

- Omitted/null `hard_reset` resolves to `false` before training-model construction.
- Explicit `hard_reset=true` and prebuilt hard-reset models raise `ValueError`.
- Checks cover RNN training, direct `TrainingEngine` execution, training-step selection, and checkpoint preparation.
- Default legacy soft-reset training and non-GLIF custom cells remain unaffected.

Hard reset cuts the direct temporal voltage-state gradient at spikes and refractory clamps; the spike surrogate does not restore that path.

Inference-only NEST construction retains hard reset by default. Inference on a trained model retains soft reset. Hard-reset compatibility evaluation requires a separate model with explicitly transferred weights and assessment of the forward-dynamics difference. External `GradientTape` loops around cells remain outside the guard.

## Performance

Matched RTX 3090 benchmark: 66,658 neurons, effective batch 32 (parallel 16+16), 500 timesteps, nine losses, FP16 compute, soft reset, exact chunk-25 BPTT, and compact online voltage loss. Each run excluded three warmups and measured 20 synchronized updates.

| Mode | Median s/update | Timed peak allocation GiB |
|---|---:|---:|
| Legacy, fused state | 4.38 | 10.71 |
| Legacy, TensorFlow state | 5.93 | 11.03 |
| NEST, TensorFlow state | 8.66 | 17.34 |

All runs retained fused CUDA currents and used matched inputs, targets, source/operator hashes, and `cuda_malloc_async` under TensorFlow 2.21.

NEST took **1.97x** the legacy fused-state time. Disabling fused state alone increased legacy time by **35%**; the remaining difference includes changed activity and state/output handling. Default BFC allocation failed in NEST backward on the 24 GiB GPU; async allocation completed the unchanged workload.

These are short engineering measurements, not convergence or hard-reset inference results. Allocation peaks exclude warmup and are not total reserved device memory. The performance limitation supports keeping NEST an opt-in compatibility mode.

## Validation

- CUDA-enabled DPointNet suite: **412 passed, 6 skipped**.
- CUDA-disabled DPointNet suite: **279 passed, 139 skipped**.
- Added 26 reset-safeguard regression cases.
- Coverage includes independent integration coefficients, gradients, FP16/FP32, CPU/GPU/fused-current comparisons, delays, reset modes, chunk continuation, Poisson replay, cached states, and timestamps.
- Bounded cross-backend tests allow at most one timestep of spike jitter; continuous-state and gradient parity are asserted when spike times match.
- GitHub CI and scientific dynamics review remain required before merge.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4d95a4542b60`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.