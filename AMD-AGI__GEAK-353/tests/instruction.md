# Issue

**Title:** fix(profile): capture prefill+decode in a single deterministic window

## Description

Fix issue #360 

## Problem

  The E2E profiler produced unusable traces, which blocked kernel-level analysis and optimization:

  1. **Adaptive re-capture bloated / OOMed the trace.** The old "enlarge window + re-capture until N decode steps" gate could keep
  doubling the window, overflowing the profiler buffer.
  2. **vLLM: server aborted on start.** The `detailed_trace_annotation:true` flag hit this build's strict pydantic schema
  (`extra=forbid`), which aborts the server on the unknown key.
  3. **sglang: capture failed / stalled in ROCm images.** The editable install could miss the `sglang.benchmark` subpackage
  (breaking bench_serving), and Python call stacks produced multi-hundred-MB traces whose flush blocked the scheduler (health drops, requests time out).

  ## Changes

  **`adapters/vllm.sh`**
  - Drop the unusable `detailed_trace_annotation:true` flag. Prefill/decode split now falls back to the analytic `est_calls` / shape
  path. `record_shapes` stays on for Input Dims.

  **`adapters/sglang.sh`**
  - Prepend `_SGL_PP` to `PYTHONPATH` so `sglang.benchmark` resolves (fixes bench_serving) in both `adapter_launch` and
  `adapter_bench`.
  - Set `with_stack=false` and `activities=["CPU","GPU"]` to avoid the giant stack-heavy trace that blocks the scheduler.
  Configurable via `SGLANG_PROFILE_ACTIVITIES` / `SGLANG_PROFILE_WITH_STACK`.

  **`bench_e2e.sh`**
  - `PROFILE_WARMUP_SEC` default `15 → 0`: arm the profiler at load start so the capture includes the initial prefill.
  - Replace the adaptive re-capture loop with a **single deterministic, analytic capture** for both backends.
  - Auto-derive `TPOT_MS` from the timed bench's `RESULT_JSONL` (median of `median_tpot_ms`) so the vLLM window scales to the real 
  per-step time.
  - Add `PROFILE_NUM_STEPS_MAX` (default 64) to cap sglang captured steps and `PROFILE_WINDOW_SEC_MAX` (default 60) to bound the 
  vLLM window; vLLM window sized as `TARGET_STEPS·TPOT·1.5` clamped to `[40, MAX]`.

  **Removed**
  - `decode_steps.py` — only served the now-removed representativeness gate; its launch-count proxy was a coarse signal no longer needed.

  ## Testing

  Validated with Qwen3-14B-FP8 across concurrency levels 2/8/32/64 — profiles now capture both prefill and decode in one bounded
  window on both backends.

  With correct profiling, the captured traces surfaced the hot kernels and drove real E2E speedups:

  | Backend | Model | Optimization | Speedup |
  |---|---|---|---|
  | vLLM 2.23 | gpt-oss-120b | Triton kernel optimization | **1.28x** |
  | sglang 0.5.15 | Qwen-14B | `gemm_a8w8_blockscale` Triton → CK + CK tuning | **1.77x** |

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e9bf65f0acfe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.