# Issue

**Title:** fix: resolve immediate issues

## Description

## Summary

Fixes six open issues in one branch, one commit per issue:

- **#18** — Replace `copy.deepcopy` with `safe_copy_args`/`safe_copy_kwargs` to prevent infinite loops on inputs with circular references
- **#43** — Use `inspect.getfullargspec` to disambiguate a tuple/list of tensors as a single forward arg vs. multiple positional args
- **#52** — Add `module_training_modes` dict to `ModelHistory` tracking train/eval mode per submodule
- **#48** — Add leaf-module check in `_check_if_only_non_buffer_in_module` so functional ops after container modules render as ovals, not rectangles
- **#46** — Include output layer parents in `_tensor_nums_to_save` during fast pass so output `tensor_contents` gets populated
- **#58** — Capture/restore RNG state before pytorch decoration so the two-pass architecture works for stochastic depth models

Also speeds up `test_stochastic_loop` by starting with a higher input value (98.0 instead of 0.0) so the while-loop terminates in ~4 iterations instead of ~200.

## Test plan

- [x] `pytest tests/test_toy_models.py` — 101 passed
- [x] `pytest tests/test_metadata.py` — 77 passed
- [x] 178 total tests, 0 failures

, , , , ,

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5eda297d123b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.