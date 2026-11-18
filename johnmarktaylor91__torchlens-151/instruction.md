# Issue

**Title:** feat(visualization): node-mode presets + single-module focus (Phases 2-3)

## Description

## Summary

Phase 2 of the visualization sprint, plus the Phase 3 commit that landed on this branch via the broken stacked-PR merge.

This branch contains:
- ddfdd34 feat(visualization): node-mode presets (default, profiling, vision, attention)
- 155be75 feat(visualization): single-module focus (module= arg + ModuleLog.show_graph)

### Replaces

- #148 (closed automatically when its base branch was deleted on merge of #147)
- #149 (showed as MERGED but actually merged into codex/viz-modes, not main)

### Test plan

- [x] tests/test_node_modes.py
- [x] tests/test_module_focus.py
- [x] mypy / ruff clean
- [x] smoke + targeted viz tests pass

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `70b9f77f6599`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.