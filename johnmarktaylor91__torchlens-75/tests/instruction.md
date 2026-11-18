# Issue

**Title:** feat: add ModuleLog, ModulePassLog, and ModuleAccessor

## Description

## Summary

- Introduces `ModuleLog`, `ModulePassLog`, and `ModuleAccessor` classes for structured per-module metadata access via `log.modules["features.3"]`
- Captures module metadata (class, source, params, hooks, hierarchy, forward args) during `prepare_model()` and builds structured objects during postprocessing
- Migrates `vis.py` and `interface.py` from old flat `module_*` dicts to the new `ModuleAccessor` API

## Details

**New classes** (`torchlens/data_classes/module_log.py`):
- `ModuleLog` — per-module-object with identity, source info, address/call hierarchy, passes, layers, params, state
- `ModulePassLog` — per-(module, pass) with layers, input/output layers, forward args, call children
- `ModuleAccessor` — dict-like accessor supporting address (`"features.3"`), index (`0`), pass notation (`"features.3:2"`), with `to_pandas()` and `summary()` methods

**Key design decisions**:
- Single-pass modules delegate per-call fields transparently; multi-pass modules raise a helpful `AttributeError` directing users to `.passes[N]`
- Metadata captured in `prepare_model()` before module cleanup strips `tl_*` attrs
- Module reuse detected via `id(module)` tracking → populates `all_addresses`
- Old `module_*` dicts preserved as internal working state for backward compat; vis.py and interface.py fully migrated

## Test plan

- [x] 44 new tests in `tests/test_module_log.py` covering all classes, fields, hierarchy, multi-pass, delegation, and integration
- [x] Full test suite passes (315 tests, 0 failures)
- [x] Manual smoke test with simple, nested, and recurrent models

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `01327731e450`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.