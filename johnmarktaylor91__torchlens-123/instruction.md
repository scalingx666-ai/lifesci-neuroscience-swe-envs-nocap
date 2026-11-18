# Issue

**Title:** feat: add verbose mode and unify render scripts

## Description

## Summary
- Add `verbose: bool = False` parameter to `log_forward_pass`, `show_model_graph`, and internal pipeline functions — prints `[torchlens]`-prefixed timed progress at each major pipeline stage
- Replace `scripts/run_250k.py` and `scripts/run_1M.py` with a single `scripts/render_large_graph.py` that accepts any node count via CLI args
- Fix `_trim_and_reorder_model_history_fields` to preserve all non-ordered attributes (not just private ones)

## Test plan
- [x] `pytest tests/ -k smoke` passes (18/18)
- [x] `verbose=True` prints expected output on simple model
- [x] `verbose=False` (default) prints nothing
- [x] Two-pass path with `verbose=True` shows both passes
- [x] `show_model_graph(..., verbose=True)` shows render messages

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `087d42d03a75`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.