# Issue

**Title:** perf(capture): O(1) tensor/param extraction via ArgSpec lookup table

## Description

## Summary

- **Replace expensive BFS crawl** (~1.44s, 39% self-time, ~1.9M `getattr` calls per Swin-T forward pass) with O(1) position-based lookups using a static `ArgSpec` table of 350+ torch functions
- **Three-tier strategy**: static table for known torch functions → dynamic cache for user-defined modules → BFS fallback (fires at most once per unique class, then cached)
- **Hoist `warnings.catch_warnings()`** from per-attribute level (~77K entries) to per-call level (1 entry)
- **Add usage stats + coverage test**: collects per-function call counts during test runs, writes CSV report, asserts 100% lookup table coverage

**Benchmark**: Swin-T `log_forward_pass` **5.91s → 4.41s (-25%, 1.5s faster)**

## Files changed

| File | Change |
|------|--------|
| `torchlens/capture/arg_positions.py` | **NEW** — ArgSpec dataclass, 350+ entry lookup table, `extract_tensors_and_params()`, dynamic caching |
| `torchlens/capture/output_tensors.py` | Use lookup table instead of BFS crawl in `_build_shared_fields_dict` and `_build_param_fields` |
| `torchlens/_state.py` | Usage stats fields + dynamic cache dict |
| `torchlens/decoration/torch_funcs.py` | Stats increment when collection flag is on |
| `torchlens/utils/introspection.py` | Hoist `warnings.catch_warnings()` from inner loop to outer call |
| `tests/conftest.py` | Session fixture for stats collection + `pytest_collection_modifyitems` for test ordering |
| `tests/test_arg_positions.py` | **NEW** — Coverage assertion test + CSV report generation |

## Test plan

- [x] Full test suite passes (`pytest tests/`)
- [x] Coverage test confirms 100% lookup table coverage
- [x] Benchmark confirms 25% speedup on Swin-T
- [x] Smoke tests pass (`pytest tests/ -m smoke`)
- [ ] CI passes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `55df02036c09`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.