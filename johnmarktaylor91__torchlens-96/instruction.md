# Issue

**Title:** fix(core): resolve remaining open bugs — FLOPs, PERF-21, mypy types

## Description

## Summary
- **Bug 19**: Verified fast-pass buffer orphan is resolved by Bug 116 guard; added 2 regression tests
- **FLOPs accuracy**: Fix addbmm/baddbmm batch dimension, add dedicated einsum handler, fix pool kernel_size extraction; added 5 regression tests
- **PERF-21**: Cache `get_ignored_functions()`/`get_testing_overrides()` in `_get_torch_overridable_functions()` to avoid repeated calls
- **Bug 154-161 (mypy)**: Type annotations for sentinel objects, reused variables across types, dynamic attribute access, generic containers, and TYPE_CHECKING imports

## Bugs resolved
Bug 19, 154, 155, 156, 157, 158, 160, 161, PERF-21, plus 3 FLOPs accuracy fixes (addbmm, einsum, pool)

## Deferred (need larger refactors)
Bug 9, 55, 88, 93, 102

## Test plan
- [x] `pytest tests/test_metadata.py -k flops` — 36 passed (5 new)
- [x] `pytest tests/test_save_new_activations.py -k Bug19` — 2 passed (2 new)
- [ ] Full test suite (`test_distilbert` failure is pre-existing on main)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `17bb57ab3f44`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.