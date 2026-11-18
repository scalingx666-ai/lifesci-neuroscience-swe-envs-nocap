# Issue

**Title:** DPointNet: preserve projection rounding in fused current accumulation

## Description

## Summary

Fix the numerical boundary of DPointNet fused **forward current** accumulation: round the standalone synaptic projection to the compute dtype, then add the initial current exactly once.

- Fixed-four kernels no longer seed their reduction with the baseline; retain safe elementwise input-buffer forwarding.
- Atomic routes project into a separate zeroed output and add the initial current after projection on the same TensorFlow stream.
- Preserve the initial-current identity VJP, spike/canonical-weight VJPs, public ABI, accelerator selection and dynamics defaults.
- Add 92 GPU value/VJP/recomputation cases and native developer documentation.

This is independent of `use_fused_recurrent_accumulation`, the recurrent **weight-gradient** carrier; that option is not disabled by this fix.

## Why

Seeding a projection with an existing current reassociates every synaptic contribution with the baseline, allowing small contributions to disappear and changing threshold crossings even in FP32.

The original full-V1 batch32 failure reproduced before backward or Adam: first current difference at tick 1, voltage difference at tick 2, and spike difference at tick 301. Independent legal FP32 reduction trees reproduce the early current values; emulation of the original fixed-four seeded/FMA arithmetic matches captured GPU outputs bitwise. This establishes a numerical-association mechanism, not an indexing/buffer-corruption diagnosis or exhaustive proof of race freedom.

The repair does **not** make atomic projection deterministic or promise bitwise equality for arbitrary regroupings of multiple projections.

## Validation

The completed receipts below belong to isolated `8381b54c`-based qualification. This PR applies the **byte-identical CUDA source, regression tests and developer RST** to current `develop` (`b28e1cd`, after AllenInstitute/bmtk#479). All native build inputs and the build script match the qualified snapshot. Integrated current-base GitHub CI results are separate and are not claimed green in advance.

| Check | Result |
| --- | --- |
| New primitives, V10032 | **92 passed** |
| Same 92 primitives, L40S | **92 passed** |
| Original fixed-four rounding regression | **4 expected failures** on original implementation, batches 1/4/16/32 |
| Existing current/temporal-adjoint/precision-credit GPU subset, V10032 | **597 passed / 25 skipped** |
| Complete CUDA-disabled TF2.21/Keras3 suite | **1594 passed / 1074 skipped** |
| Complete actual Python3.8/TF2.13/Keras2 suite | **1594 passed / 1074 skipped** |
| Full V1 FP32, batch32, 500 steps, checkpoint25, both families | Three updates pass exact counts and unchanged state/canonical-gradient/Adam tolerances, constraints and destructive all-master/input/optimizer/reset restore |
| Frozen batch1 oracle | All 32 initial per-neuron count vectors match exactly on both families |
| Canonical gradients | Worst repaired-vs-reference relative L2 below **7.15e-8**; initial reference-vs-frozen-batch1 below **8.08e-8** |
| Native docs | Full site rendered; 12 unchanged baseline diagnostics, none new |
| Publication checks | Python3.8/3.13 syntax, full patch review, whitespace and qualified-file hash checks passed |

New tests cover FP16/FP32, batches 1/4/16/32, ordinary/fixed-four/active-row/device-queue/run-aggregation routes, eager/compiled repeated calls, distinct counted inputs, independent values, analytic VJPs and recomputation. The 92 GPU-only cases are included among CPU skips, not added to CPU pass totals.

Both native libraries were rebuilt for SM61/70/75/80/86/89/90 plus PTX90; execution here covers V10032 and L40S, not every compiled family. L40S full-V1 qualification retains native recurrent gradient accumulation **ON**; V100 auto selects it OFF.

Matched full-update timings (20 synchronized samples after 3 excluded warmups) are essentially unchanged against safe native current-accumulation-OFF controls: V10032 **6.6161s vs 6.6384s** (-0.34% time), L40S **3.0883s vs 3.0661s** (+0.72%). No significant speedup is claimed.

### Focused GPU reproduction

Rebuild both operators in an ABI-compatible environment, then run:

```bash
DPOINTNET_CUDA_ARCHS="61 70 75 80 86 89 90" \
  python -m bmtk.simulator.dpointnet.custom_ops.build
python -m pytest -q tests/simulator/dpointnet/test_current_accumulation_rounding.py
```

### Limits

No complete GPU publication suite, repaired RTX3090 rerun, full-V1 mixed precision, distributed-training interaction, all-family or convergence qualification is claimed. Existing CPU CI disables fused CUDA and cannot replace hardware receipts. Local flake8 was unavailable; immutable environments were not modified.

Source-only fix: no generated binaries, private workload data, installed runtime migration or scientific-environment changes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b28e1cd84f7a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.