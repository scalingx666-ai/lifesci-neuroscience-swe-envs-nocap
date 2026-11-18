# Issue

**Title:** Adaptive mixed-mode K allocation for the unified dispatcher

## Description

## Summary

Adds **adaptive K allocation** to the `mixed` pipeline mode of the unified dispatcher. Instead of a static `K = N//2` split between LLM-`planned` workers and `fixed`-canonical workers, the dispatcher now recomputes `K` each round from per-source verified speedups and allocates proportionally, clamped to `[1, N-1]` (always keeps an exploration floor on both arms).

Signal quality is hardened beyond a naive mean:
- **Max-seeking:** scores each source by its *best* result (optimization is max-seeking), not the mean — so a single strong planned strategy actually shifts allocation.
- **Plausibility clamp** (`MAX_PLAUSIBLE_SPEEDUP`): rejects timing-saturation / garbage speedups so they can't hijack `K`.
- **Failure penalty:** weights each source's score by its success rate; failure-prone sources lose slots.

Supporting plumbing + fixes:
- `per_task` outcomes (`{label, kind, speedup, status}`) now flow end-to-end: planner → task `.md` YAML → `evaluate_round_best` → `round_evals` → `_k_for_mode`.
- `GEAK_PIPELINE_MODE` env override so `fixed`/`planned`/`mixed` are selectable from the CLI.
- **Bug fix:** removed a `kind` passthrough into `AgentConfig` that crashed every worker (`TypeError: unexpected keyword argument 'kind'`).
- Edge-path hardening: failure-path `RoundEvaluation` returns now carry `per_task`, so partial-failure rounds still feed adaptation (prevents `K` silently pinning at `N//2`).

## Commits
- `1433875` Adaptive K allocation for mixed mode dispatch
- `e5b3ac1` Add adaptive mixed mode documentation (`ADAPTIVE_MIXED_MODE.md`)
- `273ae76` Drop `kind` from dispatch.py agent cfg passthrough (+ 37-case test suite)
- `5c936f9` Allow `GEAK_PIPELINE_MODE` env override for pipeline mode selection
- `3423e96` Strengthen adaptive-K: max-seeking signal, clamps, failure penalty

## Validation
- **Tests:** `tests/run/test_adaptive_k.py` (max-vs-mean, clamp, failure penalty, edge-path `per_task` carry, full `_k_for_mode` matrix, `_resolve_task_kind`) + existing dispatcher/evaluation/pipeline suites pass.
- **Empirical (18 Triton + HIP kernels, full/5-round, mixed vs baselines):** adaptive K confirmed adapting at runtime (e.g. `gemm` round-2 `K=7`, `refk_fp8` `K→4`, `refk_identity` `K→10`) where the prior mean-based logic was flat. Best-of-runs mixed ≈ parity with the planned/fixed baselines on the fair kernel set (wins L1/L2; L3 rope/MoE is the remaining gap). HIP mixed produced real wins (e.g. `roipoint_pool3d` 27.6x, `assign_score_withk` 5.0x, `knn` 4.3x).

## Test plan
- [ ] `pytest -q tests/run/test_adaptive_k.py tests/run/test_orchestrator_dispatch.py tests/run/test_unified_pipeline.py`
- [ ] Run a kernel in `mixed` mode with `N>=3` over multiple rounds; `grep "Dispatcher: mode=mixed N=.. K=.."` and confirm `K` shifts toward the stronger source across rounds.
- [ ] Confirm `fixed` (K=0) and `planned` (K=N) modes are unchanged.

Base: this targets `gwiab-scheduler` (the mixed-mode feature is built on its unified-loop/dispatcher architecture); it should land via gwiab-scheduler → main.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1cf631d532fc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.