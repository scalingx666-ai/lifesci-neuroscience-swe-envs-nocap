# Issue

**Title:** feat(data): add MACs + convert 23 fields to computed properties

## Description

## Summary
- Add MACs (multiply-accumulate) computed properties to LayerPassLog, LayerLog, ModelLog, and ModuleLog (`macs`, `total_macs`, `total_macs_nice`)
- Convert 23 stored fields across all data classes to `@property` methods that derive from existing data, reducing field count, eliminating stale-data risks, and removing ~150 lines of write-site code across capture/postprocess

## Converted fields
**LayerPassLog** (10): `has_parents`, `has_siblings`, `has_spouses`, `sibling_layers`, `spouse_layers`, `computed_with_params`, `num_param_tensors`, `is_computed_inside_submodule`, `module_nesting_depth`, `is_submodule_input`

**LayerLog** (4): `computed_with_params`, `num_param_tensors`, `is_computed_inside_submodule`, `module_nesting_depth`

**ModelLog** (9): `model_is_recurrent`, `model_max_recurrent_loops`, `model_is_branching`, `model_has_conditional_branching`, `num_tensors_total`, `tensor_fsize_total_nice`, `tensor_fsize_saved_nice`, `elapsed_time_total`, `elapsed_time_torchlens_logging`

**ModuleLog/ModulePassLog** (4): `num_layers`, `is_shared_module`/`is_shared`

## Test plan
- [x] All 18 smoke tests pass
- [x] Metadata invariants pass (including param tensor count check)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `07bc33586b25`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.