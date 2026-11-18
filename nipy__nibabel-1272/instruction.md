# Issue

**Title:** RF: Deprecate longdouble<->int hacks

## Description

We had a pair of functions `as_int()` and `int_to_float()` that handled bugs in numpy that existed at least as recently as 1.11, but which no longer exist in 1.20, our current minimum.

This PR replaces `as_int(...)` with `int(...)` and `int_to_float(..., dtype)` with `dtype(...)` and deprecates these functions. Regression tests to ensure that these native Python/numpy functions work as expected are retained.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dabfc4681899`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.