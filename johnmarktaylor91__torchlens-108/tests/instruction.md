# Issue

**Title:** fix(gc): weakref back-references + optional call stack collection

## Description

## Summary

- **WeakRef back-references (GC-2, GC-3, GC-4)**: Convert 5 circular back-references from strong to `weakref.ref()` across LayerPassLog, LayerLog, LayerAccessor, ModuleLog, and BufferAccessor. ModelLog is now garbage-collected immediately when the last strong reference is dropped — GPU tensors no longer leak until Python's gen-2 GC cycle.
- **Optional call stack collection (PERF-19)**: Add `save_call_stacks: bool = True` parameter to `log_forward_pass()`. When `False`, skips `_get_func_call_stack()` on every tensor operation (the main per-op overhead). Defaults to `True` for backward compatibility.
- **Fix `_trim_and_reorder` weakref drop**: The `callable()` filter in `_trim_and_reorder_layer_entry_fields` was silently dropping `weakref.ref` objects (they're callable). Added `isinstance(value, weakref.ref)` exemption.

## Test plan

- [x] `pytest tests/ -m smoke` — 18 smoke tests pass
- [x] `pytest tests/test_metadata.py` — all 107 metadata tests pass (including call stack tests)
- [x] `pytest tests/test_internals.py` — all 41 internals tests pass (FIELD_ORDER sync)
- [ ] `pytest tests/ -m "not slow"` — full non-slow suite
- [x] Manual GC verification: `del model_log; gc.collect()` immediately collects ModelLog

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `86c39316b21d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.