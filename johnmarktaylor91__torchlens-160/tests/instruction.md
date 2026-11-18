# Issue

**Title:** feat(visualization): cylinder shape for buffer nodes

## Description

Replaces #159, which was auto-closed when its base (`codex/buffer-vis-tristate`) was deleted on merge of #158.

Switches the visual treatment of visible buffer nodes from a gray box to a white cylinder, and drops the now-unused `BUFFER_NODE_COLOR` constant. Shape carries the "stored model state" semantic; the gray color axis stays reserved for the param-state ladder.

Phase 2 of the buffer-visualization revamp -- builds on #158.

## Changes

- `torchlens/visualization/rendering.py`: removed `BUFFER_NODE_COLOR`; visible buffer nodes now use `shape="cylinder"` with default white fill.
- `tests/test_buffer_visibility.py`: added `test_visible_buffer_uses_cylinder_shape` smoke test.

## Quality gates (run by codex on the original branch before rebase; content is identical)

- ruff format / ruff check: passed
- mypy torchlens/: passed
- pytest -m smoke: 51 passed
- pytest tests/test_buffer_visibility.py: 6 passed
- pytest tests/test_real_world_models.py -m "not slow": 23 passed, 1 skipped
- pytest tests/test_output_aesthetics.py: 12 passed

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `79d65fea9f66`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.