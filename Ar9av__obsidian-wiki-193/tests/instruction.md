# Issue

**Title:** fix(code-understand): gate codegraph index_state on codegraph.db alone

## Description

## Summary
- `index_state()` required both `.codegraph/codegraph.db` and `.codegraph/source.json` to consider the codegraph index initialized. codegraph 1.5.0 never writes `source.json`, so `initialized` was permanently `False`.
- This made `doctor`'s warning look cosmetic but wasn't: `ensure_index()` picked `init` unconditionally (its `sync` branch was unreachable), so the index silently never updated after the first run.
- `source.json` is now optional — used only as a `sourceDir` mismatch guard when present — and `initialized` is gated on `codegraph.db` alone.

## Test plan
- [x] Added `test_index_state_initialized_without_source_json` reproducing the issue's repro (db only, no source.json)
- [x] `python3 -m pytest tests/test_code_understanding.py tests/test_doctor.py tests/test_conftest_smoke.py -q` — 34 passed, 1 skipped

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7620af79ff5f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.