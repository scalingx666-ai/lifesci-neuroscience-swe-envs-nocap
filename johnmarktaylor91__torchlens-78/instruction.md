# Issue

**Title:** fix: low-hanging fruit bug sprint (25 fixes)

## Description

## Summary
- Fix 25 low-risk bugs (1–5 line changes each) across 13 source files
- All fixes are minimal, targeted, and independently verifiable
- 315 tests passing, 0 regressions

## Changes by commit

### `fix(core)`: one-liners and small guard additions
- Remove duplicate "contiguous" from `ZERO_FLOPS_OPS` (#105)
- `strip("*")` → `rstrip("*")` in `RolledTensorLog` (#67)
- Fix return type annotation `-> List[int]` → `-> Union[List[int], str]` (#135)
- `isinstance(attr, Callable)` → `callable(attr)` (#136)
- Remove dead `pass_num = 1` overwrite (#74)
- `parent_params = None` → `[]` for consistency (#132)
- Add `isinstance(ix, int)` guard for integer keys (#52)
- `max(0, len(modules) - 1)` for empty models (#141)
- Guard empty layer list in `_get_lookup_help_str` (#142)
- Explicit `raise KeyError` instead of implicit `None` (#143)
- Remove unreachable module address check (#119)
- `str()` cast for integer layer keys (#126)
- `list()` copy to prevent `getfullargspec` mutation (#109)
- Reset `has_saved_gradients` and `unlogged_layers` in `save_new_activations` (#115, #90)

### `fix(validation)`: isinstance checks and rename
- `type(val) == torch.Tensor` → `isinstance()` (12 occurrences) (#71)
- Rename misleading `mean_output` → `output_std` (#38)

### `fix(misc)`: decoration, param detection, vis forwarding
- Remove dead double-decoration guard (#69)
- `hasattr` guard for `torch.identity` (#121)
- `None` guard for `code_context` in `FuncCallLocation` (#80)
- `is_quantized` checks actual qint dtypes (#133)
- Forward `show_buffer_layers` to rolled edge check (#130, #145)

### `fix(safety)`: try/finally cleanup and exception resets
- `validate_saved_activations` wrapped in try/finally (#70)
- `show_model_graph` calls `cleanup()` in finally (#149)
- Reset `_track_tensors` and `_pause_logging` in exception handler (#112, #113)

## Test plan
- [x] `pytest tests/ -x -q --timeout=120 -k "not aesthetic and not real_world and not vit"` — 315 passed
- [x] Pre-commit hooks (ruff-format, ruff) pass on all commits
- [x] `git diff main..HEAD --stat` confirms all 14 files

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e8b1a0296bbd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.