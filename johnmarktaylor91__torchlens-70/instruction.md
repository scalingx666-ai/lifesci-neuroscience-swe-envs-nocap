# Issue

**Title:** fix(logging): handle complex-dtype tensors in tensor_nanequal

## Description

## Summary
- `torch.nan_to_num` does not support complex-dtype tensors, causing `test_qml` to crash when PennyLane quantum ops produce complex outputs
- Fix uses `torch.view_as_real` / `torch.view_as_complex` to safely handle NaN replacement for complex tensors

## Test plan
- [x] `pytest tests/test_real_world_models.py::test_qml` passes

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a9187e12bb10`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.