# Issue

**Title:** fix(decoration): Python 3.14 compat -- two-pass decoration + TypeError catch

## Description

## Summary

 -- `log_forward_pass()` fails on first call under Python 3.14 with `TypeError: unsupported operand type(s) for |: 'function' and 'types.GenericAlias'`.

**Root cause**: Python 3.14 (PEP 649) evaluates annotations lazily. During `decorate_all_once()`, wrapping `Tensor.bool` before inspecting `Tensor.dim_order` caused `inspect.signature()` to resolve `bool` in `bool | list[torch.memory_format]` to the TorchLens wrapper function instead of the builtin type.

**Three fixes:**
- Catch `TypeError` alongside `ValueError` in `get_func_argnames` (safety net for any future annotation-resolution failures)
- Split `decorate_all_once()` into two passes: collect argnames from pristine namespace first, then decorate (eliminates root cause)
- Replace `_orig_to_decorated` dict-emptiness idempotency guard with `_is_decorated` completion flag, so partial decoration failure allows retry instead of locking in incomplete state

## Changes
- `torchlens/decoration/torch_funcs.py` -- two-pass split, TypeError catch, idempotency guard fix
- `tests/test_decoration.py` -- 6 new tests (TypeError tolerance, two-pass structure, partial-decoration recovery, unwrap/rewrap flag consistency)
- `.project-context/knowledge/gotchas.md` -- 3 new entries

## Test plan
- [x] `ruff check` -- all passed
- [x] `ruff format` -- unchanged
- [x] `mypy torchlens/` -- no issues
- [x] `pytest tests/test_decoration.py` -- 90 passed
- [x] `pytest tests/ -m smoke` -- 22 passed
- [ ] `pytest tests/ -m "not slow"` -- running, 20%+ done, zero failures so far

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1af678557a0a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.