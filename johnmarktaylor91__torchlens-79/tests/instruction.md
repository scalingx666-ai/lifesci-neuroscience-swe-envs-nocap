# Issue

**Title:** feat(core): permanent toggle-gated decoration of torch functions

## Description

## Summary

- Replace per-call decorate/undecorate cycle (~2000 torch functions) with **one-time permanent decoration** at `import torchlens` time
- Single boolean toggle (`_state._logging_enabled`) gates whether wrappers log or pass through — one branch check, negligible overhead when off
- `sys.modules` deep crawl patches detached imports (`from torch import cos`) that the old approach missed entirely
- Context managers (`active_logging`, `pause_logging`) replace all `clean_*`/`safe_*` escape hatches with exception-safe alternatives
- Fixes bugs 30, 89, 112, 113, 114, GC-6, GC-7, GC-13, GC-14, PERF-12

## Changes

| File | Scope |
|------|-------|
| `_state.py` | **NEW** — global toggle, context managers, pre-computed data |
| `decorate_torch.py` | `decorate_all_once()`, `patch_detached_references()`, JIT builtin table registration |
| `model_funcs.py` | Split `prepare_model` → `_prepare_model_once` (WeakSet cached) + `_prepare_model_session` |
| `trace_model.py` | Simplified flow with `active_logging()` context manager |
| `helper_funcs.py` | Deleted 7 `clean_*` functions; `safe_copy`/`safe_to` use `pause_logging()` |
| `tensor_log.py` | Fixed exception-safety bug (bug 89) with `pause_logging()` |
| `model_log.py` | Removed `_track_tensors`, `_pause_logging`, `func_argnames` |
| `constants.py`, `logging_funcs.py`, `graph_traversal.py`, `__init__.py` | Light updates |

## Test plan

- [x] 324/324 non-slow tests pass (5 min)
- [x] `test_timm_beit_base_patch16_224` passes (JIT compatibility verified)
- [x] Exception safety: toggle off after errors, `requires_grad` restored
- [x] Fast mode (`save_new_activations`) works correctly
- [x] Torch functions work normally when toggle is off (no side effects)
- [x] Decoration consistency: 1891 unique wrappers, 0 duplicates, 1080 JIT registrations

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5ea2de61a1e3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.