# Issue

**Title:** fix: resolve 16+ test failures across full suite

## Description

## Summary

- **Resolve 16 test failures** caused by missing `soxr` dep, fixture shape mismatches, `*args` signature crashes, validation exemption gaps, infinite recursion in `_append_arg_hash`, and DeviceContext bypass for `TorchFunctionMode`
- **Fix T5 module nesting cycles** by preventing label-steal on no-op same-object returns (`to(same_dtype)`, `contiguous()`) and using saved pre-hook labels in module thread cleanup
- **Capture and restore autocast context** during logging/validation replay so perturbation tests produce matching precision
- **Fix BART validation false positive** by exempting `__setitem__` when the perturbed destination is all-zeros/all-ones

## Test plan

- [x] `pytest tests/ --ignore=tests/test_real_world_models.py` — 472 passed
- [x] All 16 originally-failing tests now pass (verified individually)
- [x] `test_bart_base` passes (was masked by soxr import error, now hits real validation)
- [x] `test_t5_small` passes without cycle-protection band-aids

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `90023fa06281`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.