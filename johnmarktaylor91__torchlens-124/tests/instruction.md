# Issue

**Title:** perf(model_prep): optimize _prepare_model_session for large models

## Description

## Summary
- Hoist `set(dir(nn.Module))` to module-level constant `_NN_MODULE_ATTRS` (computed once at import)
- Replace `dir(module)` MRO walk with `module.__dict__` + `type(module).__dict__` scans in `_capture_module_metadata`
- Pre-build `module_by_address` dict in `_create_session_param_logs` to eliminate per-parameter `getattr` chain walks
- Use `model.modules()` with cached `tl_module_address` from phase 1 instead of a second full DFS traversal

Targets PERF-36 through PERF-39. Estimated 2-4x speedup on `_prepare_model_session` for large models (500K+ modules).

## Test plan
- [x] Smoke tests pass (18/18)
- [ ] Full test suite
- [ ] `python scripts/render_large_graph.py 5000` — compare model prep timing before/after

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d2aea0fab326`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.