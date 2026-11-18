# Issue

**Title:** perf(capture): speed-optimized defaults (3.8x on Swin-T)

## Description

## Summary

- **Unified `save_source_context` flag** (replaces `save_call_stacks`) — controls both per-function call stacks AND module source/signature fetching. Default: `False`.
- **`save_rng_states=False` default** — skips per-op RNG state capture. Auto-enabled by `validate_forward_pass`. Uses `torch_only=True` when enabled (skips Python/NumPy RNG).
- **Inline isinstance extraction** — `_collect_tensor_args()` and `_collect_output_tensors()` replace BFS crawls for common flat arg/output cases.
- **`__dict__` scan for buffer prep/cleanup** — replaces `iter_accessible_attributes` (`dir()` + MRO walk) with direct `__dict__` iteration.
- **Hoisted `warnings.catch_warnings()`** — moved from per-attribute (46K entries) to caller level.
- **Lazy module metadata** — `_get_class_metadata` skips `inspect.getsourcelines`/`inspect.signature` when `save_source_context=False`.
- **Module-level `import weakref`** — moved from per-call in `_trim_and_reorder` to module level.

### Benchmark (Swin-T, single run)

| Stage | Time | Improvement |
|-------|------|-------------|
| Pre-ArgSpec | 5.91s | baseline |
| After ArgSpec (PR #109) | 4.54s | -23% |
| **After this PR** | **1.55s** | **-73% (3.8x)** |

### API changes

- `save_call_stacks` parameter renamed to `save_source_context` (default `False`)
- New `save_rng_states` parameter (default `False`, auto-enabled by `validate_forward_pass`)
- `save_function_args` already defaulted to `False`

All three features remain fully functional when enabled — they're just off by default for speed.

## Test plan

- [x] Smoke tests pass (18/18)
- [ ] Full test suite
- [ ] Benchmark on Swin-T

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `57aaa8397752`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.