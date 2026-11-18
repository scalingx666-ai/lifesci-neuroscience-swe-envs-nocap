# Issue

**Title:** perf(postprocess): optimize 6 remaining hot-path bottlenecks

## Description

## Summary

Phase 3 performance optimizations targeting 6 remaining bottlenecks in `log_forward_pass()` postprocessing identified via cProfile.

- **Cache `dir()` per type** in `extend_search_stack_from_item` — avoids repeated MRO walks for identical types (e.g. every `nn.Conv2d`)
- **Replace sorted deque with heapq** in loop detection — eliminates O(N² log N) re-sorting
- **`__dict__` + empty-field skip** in label renaming — avoids `getattr`/`setattr` overhead and skips empty fields
- **Two-phase stack capture** — defers expensive `f_locals`/`f_globals` dict lookups to only ~5-10 surviving frames instead of ~50
- **Batch orphan removal** — single-pass set-based filtering replaces N × 9 `list.remove()` calls
- **Shadow sets for module hierarchy** — O(1) membership checks while preserving insertion-order lists; also fixes dead logic bug (tuple vs string comparison)

## Benchmarks (Phase 2 → Phase 3)

| Model | Phase 2 | Phase 3 | Improvement |
|-------|---------|---------|-------------|
| ResNet-50 | 2.43s | 2.23s | **8%** |
| CORnet-S | 0.84s | 0.56s | **33%** |
| ViT-L-16 | 3.13s | 2.91s | **7%** |
| FCOS-ResNet50-FPN | 4.96s | 4.25s | **14%** |

## Test plan

- [x] `pytest tests/ --ignore=tests/test_real_world_models.py --ignore=tests/test_real_world_models_slow.py -x` — 385/385 passing
- [x] Profiled all 4 case study models — improvements confirmed

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d5bbd7d7d139`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.