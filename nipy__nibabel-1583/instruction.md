# Issue

**Title:** BF: Validate common shape during cached ArraySequence builds

## Description

## Problem

A cached append reuses its build cache without validating the next element's common shape. Arrays such as (2, 1) therefore broadcast silently into a (2, 3) sequence, manufacturing repeated coordinates despite the exact-shape contract.

## Change

After selecting the build cache, compare common_shape with build_cache.common_shape and raise the existing-style ValueError before the append resizes, writes data or updates cache bookkeeping.

Seventeen new cases cover list and generator construction, extend and explicit cached append with shapes (1, 1), (2, 1) and (2, 2); rejection before the current append changes stored data; and empty-element, variable-first-dimension and float32 controls. The 13 baseline failures comprise nine missing rejections and four nonbroadcastable mismatches that raise a NumPy assignment error instead of the common-shape error.

## Validation

- Baseline with the added regression tests: 13 failed, 4 passed.
- Patched regression tests: 17 passed.
- `python -m pytest -q nibabel/streamlines/tests`: 107 passed.
- Changed-file Ruff lint and format, syntax and whitespace checks passed.
- Clean application verified against the exact files from `fdacbf05c15f06125a481c3345a5de55a32f9ba2`.

Validation used Python 3.12.14 and NumPy 2.3.5 with current upstream source. The full tox and pre-commit gates have not been run in this constrained environment.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fdacbf05c15f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.