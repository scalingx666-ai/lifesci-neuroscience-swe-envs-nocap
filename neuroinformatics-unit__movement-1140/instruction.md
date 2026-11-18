# Issue

**Title:** Validate camera_view in orientation functions

## Description

### Summary

`compute_forward_vector()` accepts `camera_view` as a `Literal["top_down", "bottom_up"]`, but never checks it at runtime: the upward-vector branch is an `if camera_view == "top_down"` / `else` pair, so any other value (e.g. a typo such as `"topdown"`) silently takes the `bottom_up` convention and flips the resulting forward vector by 180°. `compute_head_direction_vector()` and `compute_forward_vector_angle()` delegate to it and inherit the same silent fallback.

### Changes

- Validate `camera_view` at the top of `compute_forward_vector()` and raise a `ValueError` (via the repo's `logger.error` idiom) with the message `camera_view must be 'top_down' or 'bottom_up', but got <value>`.
- Because the other two public functions funnel through it, all three now reject invalid values.
- Added a parametrized test covering the three functions x five invalid values (`"topdown"`, `"Top_down"`, `"sideways"`, `""`, `None`).

### Verification

- `python3 -m pytest tests/test_unit/test_kinematics/test_orientation.py -q` → 29 passed.
- `ruff check` and `ruff format --check` pass on both modified files.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9e316b969446`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.