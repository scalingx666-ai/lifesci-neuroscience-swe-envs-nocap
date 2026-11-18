# Issue

**Title:** fix(tests): use render_graph return value instead of reading cleaned-up .gv file

## Description

## Summary
- Commit 147c7b7 added `cleanup=True` to `dot.render()`, which deletes the intermediate `.gv` source file after rendering — breaking all 15 `TestVisualizationParams` tests with `FileNotFoundError`
- `render_graph` now returns `dot.source` (the in-memory graphviz source string) so tests use the return value instead of reading the deleted file
- No leftover `.gv` files, no existing callers affected (return value was `None` before, no callers checked it)

## Test plan
- [x] All 15 `TestVisualizationParams` tests pass
- [x] All 82 tests in `test_param_log.py` + `test_output_aesthetics.py` pass
- [x] No `.gv` source files left behind after rendering

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e47f74745d45`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.