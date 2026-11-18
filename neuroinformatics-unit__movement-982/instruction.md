# Issue

**Title:** Implement `compute_path_deviation`

## Description

## Summary
This PR adds compute_path_deviation to movement.kinematics, computing the perpendicular (unsigned) distance of each point P(t) from the infinite line defined by chord endpoints A and B.

## Key design decisions
- Unsigned distance only (3D safe)
- Infinite line projection
- Fully vectorized (no loops)
- Matches compute_path_length API
- A == B → ValueError
- n_time < 2 handled by _validate_time_points (extended with optional start/stop)

## Implementation notes
- ffill/bfill used for endpoints
- .sum(dim="space") for dot product
- xarray broadcasting safe

## Changes
- movement/kinematics/path.py
- movement/kinematics/__init__.py
- tests/test_unit/test_kinematics/test_path.py

## Test results
All tests pass locally (42 passed, 0 failed)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5326f755c844`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.