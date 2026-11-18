# Issue

**Title:** feat(parallel): GPU-derived num_parallel = max(4, 3*gpus)

## Description

## Summary
Adds `resolve_num_parallel(gpu_count) = max(GEAK_MIN_PARALLEL_WORKERS, GEAK_WORKERS_PER_GPU * gpu_count)` (defaults 4 / 3) so GEAK auto-derives its subagent count from the GPUs Ray allocates instead of the prior `ceil(gpu_ids * gpu_oversubscribe)` (which defaulted to 1 worker/GPU).

- 4 GPUs → **12 workers** (was 4); 1 GPU → 4; 8 GPUs → 24.
- Wired into `mini.py` num_parallel auto-detect; `geak.yaml` gains `min_parallel: 4` / `workers_per_gpu: 3`.
- Env overrides: `GEAK_MIN_PARALLEL_WORKERS`, `GEAK_WORKERS_PER_GPU`.

This is the GEAK-side half of the Hyperloom parallelism contract: Hyperloom sets `KERNEL_AGENT_NUM_GPUS=4` (Ray gives 4 GPUs per kernel job) and `KERNEL_OPT_MAX_PARALLEL=1` (one kernel job at a time); GEAK then derives 12 workers automatically.

## Test plan
- [x] `tests/run/test_resolve_num_parallel.py` (4 cases: gpu counts 1/2/4 + env override) — green
- [x] Live import on MI355X: `resolve_num_parallel(4) == 12`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f798589ea9e0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.