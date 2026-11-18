# Issue

**Title:** perf(decoration): optimize model prep + session attr refactor

## Description

## Summary
- **PERF-38**: Replace O(N²) list concat in `_traverse_model_modules` with `deque` for O(1) prepend
- **PERF-37**: Cache `user_methods` per class type in `_get_class_metadata`; move `_pytorch_internal` set to module-level `frozenset`
- **PERF-36**: Iterate `module._parameters` directly instead of `rsplit` on `named_parameters` addresses + lookup dict
- **PERF-39**: Skip `patch_model_instance` for already-prepared models (111x faster repeat calls)
- **Session attr refactor**: Move 4 session-scoped module attrs to ModelLog dicts keyed by `id(module)`. Remove `tl_source_model_log` (dead code). Eliminates per-module cleanup iteration in `_cleanup_model_session`.

## Benchmarks (10K modules)
| Phase | Before | After | Speedup |
|-------|--------|-------|---------|
| `ensure_prepared` (repeat) | 47.9ms | 0.43ms | **111x** |
| `ensure_prepared` (first) | 261ms | 144ms | **1.8x** |
| `_prepare_model_session` | 460ms | 362ms | **1.3x** |
| `_cleanup_model_session` | 147ms | 107ms | **1.4x** |

## Test plan
- [x] Smoke tests (18/18)
- [x] Decoration tests (61/61)
- [x] save_new_activations tests (21/21)
- [x] ELK large graph test (1/1)
- [x] Toy model tests (258/258)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fd67742e7ec9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.