# Issue

**Title:** feat(data): add ParamLog class for structured parameter metadata

## Description

## Summary

- Introduces `ParamLog` — a dedicated data class for parameter metadata — replacing scattered fields across TensorLogEntry and ModelHistory
- Adds `ParamAccessor` for convenient dict-like access by address, index, or short name (`mh.params['fc1.weight']`, `mh.params[0]`, `entry.params['weight']`)
- Trainable/frozen tallies on ModelHistory (`total_params_trainable`, `total_params_frozen`), TensorLogEntry, and per-module
- Lazy gradient detection on ParamLog — reads `param.grad` after backward is called, no timing coordination needed
- Optional `optimizer=` parameter on `log_forward_pass()` to tag which params have optimizers
- Visualization improvements: param names with bracket convention `()` trainable / `[]` frozen, trainable/frozen color coding with gradient fills for mixed layers, graph caption shows trainable breakdown, collapsed modules show trainable/frozen detail

## Test plan

- [x] 68 new tests in `tests/test_param_log.py` covering:
  - ParamLog fields and repr
  - ParamAccessor on MH and TLE (address, index, short name, ambiguity)
  - Trainable/frozen tallies at MH, TLE, and module level
  - Linked params (weight ↔ bias symmetry)
  - Recurrent/multi-pass num_passes
  - Gradient tracking (before/after backward, frozen params excluded)
  - Optimizer support (none, full, partial)
  - Visualization: param labels, bracket convention, colors, gradient fills, collapsed modules, graph caption
  - Integration: recurrent models, no-param models, parent_params cleared
- [x] All 262 tests pass (194 existing + 68 new)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8b1534e30a27`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.