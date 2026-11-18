# Issue

**Title:** refactor(design): mid-level design pass

## Description

## Summary
- Replace implicit parameter clusters with explicit dataclasses (`FuncExecutionContext`, `VisualizationOverrides`, `IsomorphicExpansionState`, `ModuleParamInfo`) — cuts 3-6 params from 15+ function signatures
- Decompose 100+ line functions into coordinator + helpers across capture pipeline, model prep, finalization, and labeling
- Extract shared patterns: `_traverse_model_modules` visitor, `_tag_untagged_buffers`, `_create_session_param_logs`
- No public API changes, no file moves, no class renames

## Test plan
- [x] 471 non-slow tests pass (`pytest tests/ -m "not slow" --ignore=tests/test_real_world_models.py`)
- [x] Import verification (`import torchlens`)
- [x] Code reviewer agent verified all modified functions in isolation
- [ ] Run real-world model tests before merge

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f3aa21aa4d3b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.