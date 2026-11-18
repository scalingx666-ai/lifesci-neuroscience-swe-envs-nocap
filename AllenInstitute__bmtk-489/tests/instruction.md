# Issue

**Title:** DPointNet: native exact-factorization drifting-grating LGN operators

## Description

## Summary

Device generation of drifting-grating LGN input currently runs a per-sample TensorFlow movie → spatial filter → temporal filter pipeline: on an RTX 3090 a batch of 32 trials × 500 steps × 17,400 units takes **0.88 s** — about half of a full training update after #488. This PR adds native operators that factor the grating response exactly and makes them the default for device generation: the same batch takes **0.105 s** (8.3×), with rates equal to the TensorFlow path to float32 rounding and the same seeded spikes.

## What

- `custom_ops/lgn_grating_ops.{cc,cu.cc}`, `lgn_common.cuh` — adapted from Javier Galván's `v1_model_utils/cuda_lgn` (credit: Javier), operators renamed with the `Dpointnet` prefix. A grating frame is `Im(e^{i(k·r + ωf + φ)})` and every stage before rectification is linear, so each unit's filtered response is `Im(A·R(t))`: `DpointnetLgnGratingCoefficients` computes the per-sample complex spatial coefficient `A` in float64 (separable Gaussian taps, bilinear corners, `SAME` edge normalisation); `DpointnetLgnGratingProbabilities` evaluates rates / `1 − exp(−rate·dt)`; `DpointnetLgnGratingSpikes` compares TensorFlow's stateless float32 uniforms with the probabilities in registers, chunked over the batch so only one chunk of uniforms is alive. No architecture-specific intrinsics; `build.sh` builds `_lgn_grating_ops.so` for the same fat-binary targets as the state and projection libraries.
- `custom_ops/lgn_grating_ops.py` — `GratingLGNKernel` derives every constant from a built `lgn_tf.lgn.LGN` (rank-one filter factors, corners/weights with the host-computed `SAME` normaliser, per-unit complex temporal responses in float64); `native_grating_lgn_available()` / `lgn_grating_op_status()` follow the other libraries' conventions.
- `DriftingGratingLGN` gains `lgn_backend="auto" | "native" | "tensorflow"` (auto: native when a compatible GPU, the library and a full LGN are present; duck-typed stand-ins keep the TensorFlow path; explicit `native` raises when unavailable) and `native_chunk` (1–16). `PerDeviceLGNIterator` picks it up through the stimulus options; the TensorFlow path is unchanged. `backend` reports the resolved choice.
- Docs: `dpointnet_lgn_pipeline.rst` “Native grating operators”.

## Numerical behaviour

On the full 17,400-unit population (batch 32, 500 steps, both rotations and the phase offset): rates differ from the TensorFlow path by at most 3.9 mHz (relative L2 5e-5); spikes use the same stateless uniforms, so 2.4e-7 of entries differ (probabilities within one float32 ulp of a uniform) and per-sample totals agree. The stimulus protocol, seeds and broadcast trial assignment are unchanged. Output is bitwise identical to Javier's reference operator.

## Measurements (RTX 3090, 17,400 units, B32 × T500, median of 5)

| Path | ms/batch | ms/sample |
|---|---|---|
| **native (this PR)** | **105** | 3.3 |
| TensorFlow `DriftingGratingLGN` (eager `map_fn`) | 877 | 27.4 |
| TensorFlow under `tf.function` | 687 | 21.5 |

Production `PerDeviceLGNIterator` with `auto`: 0.112 s/batch versus 0.881 s.

## Validation

- New `tests/simulator/dpointnet/test_lgn_grating_native.py` (6 tests: backend selection/errors, rates vs TensorFlow for both rotations and phase offset, seeded batch/chunked/single-sample spikes, current input, `tf.function`), skipped without a GPU/library; builds a 300-unit LGN from every unit type of the full population CSV (`DPOINTNET_LGN_CSV`).
- Native tests pass on **RTX 3090, TITAN Xp (sm_61), GTX 1080 Ti (sm_61) and V100**; the `SAME` normaliser is computed on the host because GPU `Conv2D` fails on V100/Pascal in this environment.
- Full suites on this exact tree: RTX 3090 native **4864 passed / 66 skipped**; CPU Keras 3 **2908 / 1985**; Keras 2 (Python 3.8, TF 2.13) **2796 / 2107**; zero failures. The pre-existing `flake8 F401` in `lgn_generator.py` is unchanged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `482563c11bef`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.