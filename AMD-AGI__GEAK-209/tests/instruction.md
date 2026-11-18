# Issue

**Title:** Feature/pytorch2flydsl kb improvements

## Description

## Summary

Iterative improvements to the PyTorch-to-FlyDSL translation agent KB, config, and harness. Focuses on reducing PyTorch compute fallbacks and improving translation correctness on the KernelBench benchmark (8 kernels, MI300X).

## What changed

**Knowledge Base (5 docs rewritten)**
- Removed false `epilogue="bias_relu"` / `epilogue="bias"` parameters from `compile_preshuffle_gemm_a8` across all KB docs — was causing compilation errors
- Added CuTe-style low-level primitives section (`rocdl.MFMA`, `fx.make_mma_atom`, `fx.make_tiled_mma`, `fx.copy`, `rocdl.BufferCopy`, `fx.make_copy_atom`, `fx.copy_atom_call`, `fx.logical_divide`) enabling true hardware-level kernel generation
- Added BatchNorm2d training-mode guidance — harness runs models without `.eval()`, so BN must compute batch statistics dynamically
- Strengthened zero-compute-fallback enforcement with concrete examples and patterns

**Translation harness (`translate.py`)**
- fp16 consistency: model and inputs cast to `.cuda().half()` in both reference and candidate runs
- Deterministic seeding: `torch.manual_seed(42)` before model creation
- Correctness tolerance aligned to KernelBench fp16 standard: `rtol=1e-2, atol=1e-2`
- Runtime dtype detection: automatically skips `.half()` for fp16 source kernels (backward-compatible)
- Support for bare function kernels (no `class Model` wrapper)

**Agent config**
- Expanded banned ops list: added `torch.ops.aten.convolution`, `torch.ops.aten.batch_norm`, `torch.batch_norm`, and generic `torch.ops.aten.*` compute ops
- `perf_fail_threshold` lowered from 0.5 to 0.1 — accepts slower but fully native translations

## Results

**Lean v4.7.5 vs baseline (PR #153)**:
- **7/8 kernels passing** (vs 8/8 baseline — ResNet fails by 0.00005 abs diff margin, see below)
- **PyTorch compute fallbacks: 6** (down from 18.2 baseline avg — **67% reduction**)
- **Average speedup (passing kernels): 1.70x** (vs 1.42x baseline)
- **CuTe primitive adoption**: 6/8 kernels now use hardware-level `@flyc.kernel` implementations (5–48 CuTe calls per kernel)

| Kernel | Level | Success | Speedup | Baseline (PR #153) | Rounds | Compute Fallbacks | Baseline Fallbacks |
|---|---|---|---|---|---|---|---|
| 25_Swish | L1 | PASS | 2.08x | 2.13x | 1 | 0 | 0 |
| 97_ScaledDotProductAttention | L1 | PASS | 4.77x | 1.32x | 1 | 1 | 1.2 |
| 12_Gemm_Multiply_LeakyReLU | L2 | PASS | 0.82x | 1.71x | 1 | 1 | 1.4 |
| 14_Gemm_Divide_Sum_Scaling | L2 | PASS | 0.92x | 1.02x | 1 | 0 | 2.0 |
| 57_Conv2d_ReLU_HardSwish | L2 | PASS | 0.95x | 1.71x | 3 | 1 | 1.0 |
| 44_MiniGPTBlock | L3 | PASS | 1.43x | 1.29x | 1 | 1 | 6.6 |
| 50_ReLUSelfAttention | L3 | PASS | 0.92x | 1.19x | 1 | 2 | 3.0 |
| 8_ResNetBasicBlock | L3 | FAIL | N/A | 0.94x | 3 | 0 | 3.0 |

> Baseline values are averages from 5 runs. Baseline used PR #153 code with the original translation prompt/KB, which allowed PyTorch compute fallbacks freely.

**ResNet**: Fully native translation (0 fallbacks, 43 CuTe calls) but fails correctness by a deterministic fp16 precision floor — 8/32M elements mismatch (99.99997% match), max abs diff 0.01171875 vs atol=0.01. Experimentally confirmed across multiple parallel runs with varied step limits and round counts. Potentially requires fp32 accumulator patterns which will be part of future testing and if successful part of next iteration.

## Test plan

These changes affect the PyTorch-to-FlyDSL translation pipeline.

**Requirements**:
- Docker image with FlyDSL 0.1.4.1
- KernelBench source kernels
- LLM API access (Claude via gateway)

**Run a translation**:

```bash
python -m minisweagent.run.preprocess.translate \
  --kernel-url /path/to/KernelBench/level1/25_Swish.py \
  --target-language flydsl \
  -o /path/to/output \
  --flydsl-repo /workspace/FlyDSL
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `738c66ce3fef`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.