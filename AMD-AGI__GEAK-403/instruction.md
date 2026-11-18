# Issue

**Title:** [e2e workflow] Bound torch-profiler host memory during long e2e runs

## Description

## Fix #398: bound torch-profiler host memory during long e2e runs

### Problem
During a 16h e2e run the pod's anonymous RSS repeatedly spiked from a flat ~21 GiB baseline to the 512 GiB cgroup limit (≥96 GiB/min), firing 7 OOM kills. The baseline did not trend up — the memory lives entirely in per-round profile windows. The holder is the **torch-profiler event buffer** in the vLLM/Ray workers, which is unbounded on the vLLM path: `/start_profile` takes no step count (we profile a wall-clock window, default 40s), and `adapters/vllm.sh` never set `torch_profiler_with_stack`, so it defaulted to `True` upstream — every event carries a full Python callstack (the biggest per-event cost).

### Changes
- **`adapters/vllm.sh`**: replace the all-or-nothing `ProfilerConfig` probe with a field-set probe and build `--profiler-config` JSON incrementally, emitting only fields the installed vLLM has (fail-soft). Key fields:
  - `torch_profiler_with_stack=false` — primary fix, drops per-event callstacks.
  - `max_iterations` — vLLM 0.26+ auto-stops the profiler after N worker steps, bounding the buffer by construction (hard bound where there was none).
  - `detailed_trace_annotation=true` — 0.26-only shape param that rides along; emit-side cheap (one event per iteration) and activates the measured prefill/decode split in `parse_profile.py` with no parser change.
  - Builds older than `ProfilerConfig` keep the existing `VLLM_TORCH_PROFILER_DIR` env fallback; the shorter window is the only bound there.
- **`bench_e2e.sh`**:
  - Lower profile window defaults (`PROFILE_WINDOW_SEC` 40→20, `PROFILE_WINDOW_SEC_MAX` 60→30).
  - `PROFILE_MAX_ITERS` (the 0.26+ `max_iterations`) is **derived from the workload**: a single `PROFILE_TARGET_STEPS = RAMP(prefill) + STEADY(decode) + margin` computed from ISL/OSL/CONC, clamped to `PROFILE_NUM_STEPS_MAX`. The profiler self-stop therefore always spans a decode steady sample instead of a fixed constant. The same target drives the sglang step count, the vLLM window, and the step cap (removes a duplicated computation).
  - On 0.26+ the wall-clock sleep is only a safety cap (the profiler self-stops); pre-0.26 it is the sole bound.
- **Keep all per-rank traces** (no rank0 pruning): pruning does not lower peak RAM (all workers buffer concurrently), and `parse_profile.py` already selects the rank0 trace itself, so extra per-rank files are harmless.
- **`profiler.md`**: doc updates; comment trims across the touched scripts.

### Impact / scope
- vLLM profiler path only. sglang path already ran with stacks off (unchanged behavior).
- Prefill is **not** under-captured: the profiler records from `/start_profile`, which the harness fires at load start (`PROFILE_WARMUP_SEC=0`, `delay_iterations=0`) before the bench client sends its first request. Verified: the first captured step in a real 0.26 trace is a pure prefill (`execute=1024, generation=0`).
- No change to what shapes/dtypes reach the kernel benchmark harness: shape/dtype are recovered via the trace's `External id` → `cpu_op` link (not callstacks), so `with_stack=false` does not affect kernel→CPU-launch attribution. Authoritative benchmark shapes come from live `capture_shapes.py`; the profiler only supplies a weight prior. `detailed_trace_annotation` makes the P/D split *more* accurate.
- `capture_torch_profiler` stays opt-in/off (upstream hardcodes stacks + profile_memory; needs separate memory validation).
### Tests
- New `test_vllm_adapter_profiler_config.py` (subprocess + fake-binary-on-PATH): asserts the 0.26 probe emits `with_stack:false` + `max_iterations` + `detailed_trace_annotation`; the <0.26 probe omits the 0.26-only fields; old builds take the env fallback. All 4 pass.
- `bash -n` clean on both adapters + `bench_e2e.sh`.
- **Real-GPU cross-version smoke (TP=4, Qwen3.5-27B-FP8):**
  - 0.26.0 — pass; buffer bound = `max_iterations` step self-stop. Trace: 32 annotated GPU steps = 1 pure-prefill + 8 mixed + 23 decode (22 at batch=64, the CONC steady state); rank traces ~7.5 MB each with stacks off.
  - 0.25.0 — pass; native `--profiler-config` path, time-window bound (no step knob).
  - 0.22.0 / 0.23.0 — CPU probe pass; `ProfilerConfig` present with `max_iterations` + `with_stack`, 0.26-only field correctly gated out.
- **Full e2e run (vLLM 0.26.0, TP=4, Qwen3.5-27B-FP8, 1024/1024/conc-64, native bench client) — status `ok`, exit 0:**
  - Server launched with the fixed `ProfilerConfig` (`torch_profiler_with_stack=False`, `max_iterations=64`, `detailed_trace_annotation=True`, `ignore_frontend=True`, `capture_torch_profiler=False`) and became healthy; baseline + profile + kernel-opt + validation all completed.
  - **Profiler memory bounded across rounds:** both profile rounds (`round_0`, `round_head`) produced 4 per-rank traces each, all **16.7–16.9 MB gz** — flat round-to-round, no growth, no OOM (vs the #398 baseline that spiked to the 512 GiB cgroup limit). This is the direct end-to-end confirmation of the fix.
  - The fix did not regress GEAK's optimization: it accepted an aiter `gemm_a8w8_blockscale` head for **+16.1% e2e**, lifting throughput 3651 → 4198 tok/s (**1.18×**, TTFT −40%).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5107c7e4b287`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.