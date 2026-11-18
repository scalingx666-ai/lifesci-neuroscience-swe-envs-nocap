# Issue

**Title:** BF: Preserve array shape for single-vertex FreeSurfer labels

## Description

## Problem

NumPy squeezes the one-row/one-column loadtxt result to a zero-dimensional array. A valid one-vertex label therefore cannot be handled with the same length and iteration operations as a multi-vertex label.

## Change

Pass ndmin=1 to both existing loadtxt calls, preserving their dtype, selected columns and header skipping.

Six self-contained temporary-file cases cover zero, one and three vertices with read_scalars=False and True. Assertions cover vector shape, native integer dtype, floating scalar dtype, exact values and equal vertex/scalar lengths. Empty-file warnings are captured and preserved. The new test has no external FreeSurfer-data marker.

## Validation

- Baseline with the added regression tests: 2 failed, 4 passed.
- Patched regression tests: 6 passed.
- `python -m pytest -q nibabel/freesurfer/tests/test_io.py`: 11 passed, 5 skipped.
- Changed-file Ruff lint and format, syntax and whitespace checks passed.
- Clean application verified against the exact files from `fdacbf05c15f06125a481c3345a5de55a32f9ba2`.

Validation used Python 3.12.14 and NumPy 2.3.5 with current upstream source. The full tox and pre-commit gates have not been run in this constrained environment. Existing FreeSurfer/data-dependent tests account for the five skips; the new synthetic tests all ran.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fdacbf05c15f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.