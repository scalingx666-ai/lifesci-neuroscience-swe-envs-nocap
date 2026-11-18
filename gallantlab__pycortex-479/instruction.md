# Issue

**Title:** FIX stop using expired deprecation for numpy 1.24

## Description

Numpy 1.24 has [expired](https://numpy.org/doc/stable/release/1.24.0-notes.html#expired-deprecations) some deprecation warnings and now raises errors. Here are the fixes for pycortex:

- Changes `np.int` into `int`, and `np.float` into `float` (dtype) or `np.float_` (casting function).
- Use explicitly `np.array(..., dtype="object")` to allow arrays of arrays of different lengths.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `94936d546a30`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.