# Issue

**Title:** TST add comprehensive headless WebGL rendering tests

## Description

## Summary
- Adds `cortex/tests/test_webgl_headless.py` with 32 parametrized tests that exercise the headless WebGL viewer across all supported data types, camera angles, surface states, and panel layouts
- Uses class-scoped pytest fixtures to share browser sessions, keeping total runtime to ~6 minutes
- All tests skip gracefully when playwright is not installed

## Test coverage

| Group | Tests | What's covered |
|-------|-------|----------------|
| Data types | 6 | Volume, Vertex, VolumeRGB, VertexRGB, Volume2D, Vertex2D |
| Camera angles | 13 | All entries in `angle_view_params` |
| Surface types | 5 | fiducial, inflated_less, inflated, inflated_cut, flatmap |
| Panel presets | 5 | All `params_*` layouts |
| View roundtrip | 1 | `_set_view` → `_capture_view` parameter verification |
| Overlay toggle | 1 | With/without ROI overlays produce different images |
| addData | 1 (xfail) | Dataset switching — blocked by `_convert_dataset` closure |

## Test plan
- [x] `pytest cortex/tests/test_webgl_headless.py -v` — 31 passed, 1 xfail
- [x] `pytest cortex/tests/test_headless.py cortex/tests/test_export.py -v` — existing 7 tests still pass

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f6783a3a0990`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.