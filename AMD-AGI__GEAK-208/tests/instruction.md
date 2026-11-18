# Issue

**Title:** feat(cli): --target wall|kernel + dual-signal harness in UTA

## Description

## Summary

- Adds `--target {wall,kernel}` to `geak` CLI (default `wall`) — picks which timing signal becomes `GEAK_RESULT_LATENCY_MS` (the value the optimizer scores against).
- Updates the UnitTestAgent (UTA) to always generate harnesses that emit BOTH signals from `--benchmark` / `--full-benchmark`, so the kernel-improvement agent can see the full latency decomposition while only one signal drives scoring.

## Motivation

Empirical study on `batched_gemm_a16wfp4` (MI355X, gfx950) showed that when the scoring signal is wall-clock only, the agent often optimizes the dispatch path rather than the GPU kernel. One winning patch reported **1.31x in-harness speedup** that turned out to be a process-local `_RESOLVED_CONFIG_CACHE` trick — when re-measured cold via `rocprofv3 --kernel-trace` in a fresh subprocess, the kernel was actually **8.7x slower**. Pointing the scoring signal at GPU-kernel-only time (`--target=kernel`) on the same kernel produced a real **1.07x cold-verified speedup** (bitwise mxfp4 quant rewrite + new specialized JSON configs). Strategy logs confirm the agent attempted only kernel-side strategies (`triton-mxfp4-quant-simplification`, `triton-tile-size-sweep`, …) under `--target=kernel`, with zero dispatch-side patches across 5 rounds × 4 strategies × ~5 patches each.

## What changed

| File | Change |
|---|---|
| `src/minisweagent/run/mini.py` | Add `--target wall\|kernel` typer option (default wall); validate; pass to `run_preprocessor`. |
| `src/minisweagent/run/preprocess/preprocessor.py` | Accept `scoring_target`; forward to `create_validated_harness`. |
| `src/minisweagent/run/preprocess/harness_utils.py` | Accept `scoring_target`; forward to `run_unit_test_agent`. |
| `src/minisweagent/run/preprocess/unit_test_agent.py` | Accept `scoring_target`; inject SCORING TARGET directive into UTA prompt; expand triton language guidance with the dual-signal recipe. |
| `src/minisweagent/run/preprocess/config/mini_unit_test_agent.yaml` | Replace single-signal Timing section with the dual-signal recipe + required output markers (`GEAK_RESULT_WALL_MS`, `GEAK_RESULT_KERNEL_MS`, `GEAK_RESULT_DISPATCH_MS`, `GEAK_RESULT_DISPATCH_FRACTION`, `GEAK_RESULT_LATENCY_MS`). |

## Backward compatibility

- `--target wall` is the default and preserves the current scoring behavior. `GEAK_RESULT_LATENCY_MS` still drives `_extract_latency` / `compute_best_patch` / `_get_speedup_cap` — none of those touch the new markers.
- The new `GEAK_RESULT_KERNEL_MS` / `_DISPATCH_*` lines are additive output the agent reads; no parser changes required.
- `scoring_target` is keyword-only with a default in every signature, so existing callers keep working.

## Why two passes for the dual signal (not one)

Empirically verified on baseline `batched_gemm_a16wfp4`:
- `do_bench` (no profiler): 0.0436 ms wall — correct.
- `cuda.Event`: 0.0442 ms wall — correct.
- `perf_counter` outside profiler: 0.083 ms wall (1.9x inflated due to per-iter sync).
- `perf_counter` INSIDE `torch.profiler` context: 0.132 ms wall (3.0x inflated due to profiler instrumentation).

So wall MUST be measured by `do_bench` outside the profiler context, and kernel-only MUST be measured by `torch.profiler` per iteration. They run as two back-to-back passes with L2 cache flush between iters.

## Try it

```bash
git fetch origin feat/dual-signal-harness-target-flag
git checkout feat/dual-signal-harness-target-flag
pip install -e .

# default (wall) — same as before
geak -t "Optimize batched_gemm_a16wfp4 for AMD MI355X." \
  --repo /path/to/aiter \
  --kernel-url aiter/ops/triton/_triton_kernels/gemm/batched/batched_gemm_a16wfp4.py \
  --gpu-ids 0,1,2,3 -o /tmp/run_wall -y

# kernel-only scoring
geak -t "Optimize batched_gemm_a16wfp4 for AMD MI355X." \
  --target kernel \
  --repo /path/to/aiter \
  --kernel-url aiter/ops/triton/_triton_kernels/gemm/batched/batched_gemm_a16wfp4.py \
  --gpu-ids 0,1,2,3 -o /tmp/run_kernel -y
```

Look for `GEAK_RESULT_WALL_MS=…`, `GEAK_RESULT_KERNEL_MS=…`, and `GEAK_RESULT_DISPATCH_FRACTION=…` lines in the harness output and in the agent's per-round logs.

## Test plan

- [ ] Verify `geak --help` shows `--target` (default wall).
- [ ] Smoke test `--target wall` on a Triton kernel — UTA-built harness contains both signals; `GEAK_RESULT_LATENCY_MS` equals wall.
- [ ] Smoke test `--target kernel` on the same kernel — `GEAK_RESULT_LATENCY_MS` equals kernel.
- [ ] Confirm `compute_best_patch` still produces non-empty `best_results.json` under both modes.
- [ ] Re-run an existing wall-only kernel and confirm reported speedup is unchanged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `61f5e71913f4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.