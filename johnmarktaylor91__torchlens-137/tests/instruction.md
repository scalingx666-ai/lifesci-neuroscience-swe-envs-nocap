# Issue

**Title:** fix(decoration): clear stale sq_item C slot after wrapping Tensor.__getitem__

## Description

## Summary

- **Bug**: After `wrap_torch()` (or any `log_forward_pass`), `torch.tensor([0-d_tensor, ...])` raises `TypeError: len() of a 0-d tensor`. Persists even after `unwrap_torch()`.
- **Root cause**: Replacing `Tensor.__getitem__` with a Python function causes CPython to set the `sq_item` C slot in `tp_as_sequence`. This makes `PySequence_Check(tensor)` return `True` (was `False` in clean PyTorch). `torch.tensor()` then tries to iterate 0-d tensor elements as sequences, calling `len()` which raises TypeError. The slot is never cleared by restoring the original `wrapper_descriptor` or by `delattr` -- this is a CPython limitation.
- **Fix**: Clear `sq_item` to NULL via ctypes after every decoration/undecoration cycle. Safe because tensor indexing uses `mp_subscript` (mapping protocol), not `sq_item`. Verified via `tp_name` guard; fails silently on non-CPython.
- Adds 9 regression tests covering all lifecycle paths (wrap, unwrap, cycles, context manager, forward pass, `unwrap_when_done`, nested lists, indexing, `PySequence_Check`).

## Test plan
- [x] All 9 new `TestSequenceSlotFix` tests pass
- [x] All 84 `test_decoration.py` tests pass
- [x] All 22 smoke tests pass
- [ ] Full `pytest tests/ -m "not slow"` suite

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `84d4644e0545`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.