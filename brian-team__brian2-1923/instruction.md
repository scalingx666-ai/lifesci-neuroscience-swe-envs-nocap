# Issue

**Title:** Fix Cython @implementation include_dirs being overwritten

## Description

## Summary

- Remove a duplicate assignment in `CythonCodeObject.__init__` that overwrote `self.include_dirs` after merging `@implementation(..., include_dirs=...)` with `prefs['codegen.cpp.include_dirs']`.
- Add `test_external_function_cython_include_dirs`, mirroring the existing C++ standalone include_dirs test: compile an external header from a temporary directory via Cython `cdef extern`.

## Test plan

- [x] `prefs.codegen.target = 'cython'` and run `test_external_function_cython_include_dirs` locally
- [ ] CI (Cython job)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a88d9f15fb88`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.