# Issue

**Title:** feat(robustness): PR1 correctness guards + torch>=2.4 floor

## Description

## Summary

Wave 1 of 4 in the robustness sprint. Correctness-critical hardening only; no behavior change for non-pathological forward passes.

### What changes
- **Re-entrant `active_logging()` guard** — nested entry raises `RuntimeError` instead of silently corrupting the outer `ModelLog` (the docstring already declared the context non-nestable; now the runtime enforces it). Realistic trigger: a user forward-hook or activation pipeline that calls `log_forward_pass` on a sub-model.
- **functorch/vmap skip warning** — inside `vmap`/`grad`/`jacfwd`, TorchLens continues to skip logging (internal ops like `safe_copy` have no vmap batching rules), but now emits a one-shot `UserWarning` per forward pass so users know the resulting log omits whatever ran inside the transform.
- **`torch>=2.4` dependency pin** — `torchlens/utils/rng.py` already calls `torch.is_autocast_enabled(device_type)` and `torch.get_autocast_dtype(device_type)`, which only accept the device argument from torch 2.4+. The bare `torch` dep was permitting installs that would fail at runtime on older torch.
- **Python 3.13 classifier** — stable since 2024-10, supported by torch 2.5+.

### Motivation
Claude catalog identified 25 runtime contexts where TorchLens can fail; this PR takes the correctness-critical subset (silent data corruption on nested calls, silent empty log on vmap) and the easy version-floor cleanup. The bigger TABLE_WITH_GUARD items ship in PR 2-4.

### Tests
New `tests/test_robustness_pr1.py` (8 cases):
- direct `active_logging` nesting raises with the non-re-entrant message
- a forward-hook that re-enters `log_forward_pass` raises and the outer session state cleans up
- a vmap-containing forward pass emits exactly one functorch warning per session; flag resets between sessions
- non-vmap passes emit no functorch warning
- pyproject torch dep pins `>=2.4` and Python 3.13 is a classifier

### Verification
- `pytest tests/ -m smoke` — 30/30 ✅
- `pytest tests/test_decoration.py tests/test_internals.py tests/test_defaults.py tests/test_api_renames.py tests/test_cross_file_refactor.py tests/test_robustness_pr1.py` — 209/209 ✅
- `ruff check .` ✅
- `mypy torchlens/` — 66 files clean ✅

## Test plan
- [x] Nested-call guard fires from both direct context-manager and forward-hook triggers
- [x] Functorch warning appears once per session, not per operation
- [x] Non-vmap passes emit no functorch warning (no spurious noise)
- [x] Outer session state cleans up after guard fires so subsequent calls work
- [x] `torch>=2.4` pin validated in pyproject
- [x] Python 3.13 classifier validated in pyproject

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `595dc181ae19`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.