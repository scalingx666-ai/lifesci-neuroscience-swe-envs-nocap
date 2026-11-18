# Issue

**Title:** Add FuncCallLocation class for structured call stack metadata

## Description

## Summary
- Introduces `FuncCallLocation` class in new `torchlens/data_classes/` package, replacing the unstructured `List[Dict]` on `TensorLogEntry.func_call_stack` with `List[FuncCallLocation]`
- Clean `__repr__` with source context and `  --->  ` arrow pointing to the call line, plus `__getitem__` and `__len__` support
- Adds configurable `num_context_lines` parameter threaded from `log_forward_pass()` through `ModelHistory` to the stack collection helper
- Extracts function signature and docstring metadata when available

## Test plan
- [x] 16 new tests covering class structure, content correctness, dunders, context lines, and labeled context
- [x] Full existing test suite (194 tests) passes with no regressions

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `34f246687bc4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.