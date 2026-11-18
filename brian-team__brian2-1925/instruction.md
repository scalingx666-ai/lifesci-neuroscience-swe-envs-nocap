# Issue

**Title:** Include compiler kwargs in Cython extension cache key

## Description

## Summary

- Extend `CythonExtensionManager.create_extension` cache key (and thus default `_cython_magic_*` module names) with distutils/Cython settings: `define_macros`, `include_dirs`, `library_dirs`, `runtime_library_dirs`, `extra_compile_args`, `extra_link_args`, `libraries`, and `sources`.
- Add `test_cython_extension_cache_key_includes_include_dirs`: same generated Cython body, two temp header directories (`2*x` vs `3*x`), assert distinct modules and correct `main()` results.

## Notes

Complements #1923 / #1922 (forwarding user `include_dirs` to `create_extension`). Without this change, identical generated code could still reuse a stale `.so` or in-process cache entry when only compiler kwargs differ.

## Test plan

- [x] `pytest brian2/tests/test_codegen.py::test_cython_extension_cache_key_includes_include_dirs`
- [ ] CI

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a88d9f15fb88`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.