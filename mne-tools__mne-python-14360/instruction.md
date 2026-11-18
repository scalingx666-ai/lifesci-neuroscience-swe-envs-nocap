# Issue

**Title:** FIX: Prevent memory leak in RawArray by removing data from _init_kwargs

## Description

This fixes: 

### Description of the problem
`BaseRaw.__init__` captures constructor arguments in `self._init_kwargs` via `_get_argvalues()`. For `RawArray`, this includes the complete signal array (`self._init_kwargs["data"]`).

When operations such as `resample()` or `crop()` replace `raw._data`, `self._init_kwargs["data"]` continues to hold a strong reference to the original array, preventing it from being garbage collected. In addition, `raw.copy()` deep-copies `_init_kwargs`, duplicating the unused dead array and multiplying memory usage.

### Solution
1. Remove `"data"` from `self._init_kwargs` in `RawArray.__init__` immediately after `super().__init__(...)`.
2. Update `_test_raw_reader(RawArray, ...)` in `test_array.py` to pass `test_kwargs=False` (since in-memory `RawArray` objects cannot be re-instantiated without data like disk-based readers).
3. Add a `weakref` regression check in `test_array_copy()` ensuring `raw._data` replacement allows the original array to be collected and that `"data"` is absent from `_init_kwargs`.

### Assistance Disclosure
In accordance with the MNE AI-assistance policy in CONTRIBUTING.md, an AI coding assistant was used to help trace the frame inspection in `_get_argvalues()` and draft the regression test.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f15f9fb465c0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.