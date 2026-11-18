# Issue

**Title:** chore(tests): add @pytest.mark.smoke to 18 critical-path tests

## Description

## Summary
- Register `smoke` marker in `pyproject.toml`
- Add `@pytest.mark.smoke` to 18 fast, critical-path tests across 9 files
- Covers: core pipeline, fast path, decoration, LayerLog, ModuleLog, metadata, validation, visualization, internals

Run `pytest tests/ -m smoke` for ~6s "did I break something obvious?" feedback during development.

## Test plan
- [x] `pytest --collect-only -m smoke -q` shows exactly 18 tests
- [x] `pytest tests/ -m smoke -v` — all 18 pass in ~6s

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `25f16ccbe8f6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.