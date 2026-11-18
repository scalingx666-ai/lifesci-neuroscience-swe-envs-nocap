# Issue

**Title:** fix(perf): cache bytecode column offsets, fast-skip empty-branch attribution, guard CUDA probes on CPU runs

## Description

## Summary
- Cache `_get_col_offset()` bytecode disassembly per code object so transformer-style hot paths stop re-walking the same `dis.get_instructions` output.
- Fast-skip Step 5 branch attribution when the model has no captured terminal scalar bools, eliminating per-op AST work for CV/audio/MLP models.
- Gate `torch.cuda.empty_cache()` calls in postprocess and capture paths behind the cached `_is_cuda_available()` so CPU-only runs skip CUDA driver / NVML probes.

Reference: `.project-context/research/profiling_audit_2026-04-27.md` (audit findings #2, #3, #4 -- all MEDIUM, time-perf).

## Per-fix details

### Fix 1 -- column-offset cache
- Files touched:
  - `torchlens/utils/introspection.py` (cache + helpers + cap warning + cache-clear hook)
- Audit: GPT-2 spends ~16.5s self time across `dis.*`; `_get_col_offset()` was disassembling the same code object on every captured frame.
- Approach: `dict[id(code_obj), dict[offset, column]]` keyed lookup; soft cap of 100K entries with a one-shot warning; old entries are implicitly evicted when their code objects are freed (e.g. `importlib.reload`).
- Expected impact: ~50% speedup on transformer-style models that pay heavy bytecode-introspection cost.

### Fix 2 -- branch attribution fast-skip
- Files touched:
  - `torchlens/postprocess/control_flow.py` (fast-skip helper + slow-path defensive assert)
- Audit: Step 5 branch attribution costs 2.14s on ResNet50 and 2.29s on GPT-2 even though those models have no user conditional branches.
- Approach: when `ModelLog.internally_terminated_bool_layers` and every derived conditional collection are empty, skip the AST file indexing, per-bool classification, and per-op `attribute_op()` work entirely. Defensive assert on the slow path catches any future refactor where conditional keys appear without `internally_terminated_bool_layers` being populated.
- Expected impact: eliminates Step 5 cost on models with no conditionals (most CV/audio/MLP models).

### Fix 3 -- CUDA probe guard
- Files touched:
  - `torchlens/postprocess/__init__.py` (Step 14 + fast-pass empty_cache calls)
  - `torchlens/capture/trace.py` (final cleanup empty_cache)
  - `torchlens/data_classes/cleanup.py` (full-teardown empty_cache + docstring)
- Audit: CPU-only ResNet50 spends ~1.64s cumulative in CUDA device count / NVML checks; ~12% overhead.
- Approach: existing `torchlens.utils.tensor_utils._is_cuda_available()` already caches the first probe result; this PR routes every previously-uncached `torch.cuda.empty_cache()` call site through it. CUDA availability is process-fixed, so the cache is correct across all subprocess scenarios.
- Expected impact: eliminates ~12% overhead on CPU-only runs.

## Tests
- New: `tests/test_perf_bundle.py` -- 11 behavioral tests across the three fixes.
  - Column-offset cache: hit/miss/different-code/unknown-offset coverage with `dis.get_instructions` invocation counting.
  - Branch fast-skip: non-conditional model never invokes `attribute_op` / `classify_bool`; conditional model still runs the slow path and produces non-empty events; empty model (no ops) does not crash.
  - CUDA probe guard: CPU-only path observes zero `empty_cache` calls and at most one `is_available` call; CUDA-available path still invokes `empty_cache`.
- Optional `@pytest.mark.slow` end-to-end probe that exercises `log_forward_pass` after the bundle.
- Behavior is unchanged: `ModelLog` output is byte-identical for the test fixtures (verified via the existing smoke + non-slow suites passing without regressions).

## Quality gates
- `ruff format .`
- `ruff check . --fix`
- `mypy torchlens/`
- `pytest tests/ -m smoke -x --tb=short`
- `pytest tests/test_perf_bundle.py -v`
- `pytest tests/ -m "not slow" -x --tb=short` (1436 passed, 21 skipped, 192 deselected, 2 xfailed)

## Test plan
- [x] All six quality gates pass on this branch.
- [ ] Reviewer spot-checks the fast-skip precondition list against any local conditional-pipeline refactors.
- [ ] Optional: run the audit's GPT-2 probe locally to confirm the >=80% drop in `dis.*` self time.

## Followups
Profiling audit findings #5 (`patch_detached_references` first-call cost) and #6 (AST/file cache for daemon processes) are deferred -- LOW severity, no plans to ship in this bundle.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b5a7502ed0d2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.