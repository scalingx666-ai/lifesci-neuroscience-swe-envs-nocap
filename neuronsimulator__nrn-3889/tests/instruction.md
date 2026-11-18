# Issue

**Title:** neuronapi: nrn_symbol_array_dims for every array dimension

## Description

`nrn_symbol_array_length` returns only the first dimension, so a client cannot size `double a[3][4]` or `objref o[2][5][7]`.

New `int nrn_symbol_array_dims(const Symbol* sym, int* dims, int max_dims)` returns the number of dimensions (0 for a scalar or `NULL`) and writes up to `max_dims` sizes into `dims`, outermost first. `dims` may be `NULL` to only count. It reads the same `sym->arayinfo` that `nrn_symbol_array_length` uses. Documented in `capi.rst`.

Test: `test/api/symbol_array_dims.cpp` covers:
- 2-D double and 3-D objref arrays;
- a buffer shorter than the number of dimensions (nothing is written past it);
- count-only;
- a scalar and `NULL`;
- the `xraxial` range-variable array;
- redeclaring an array with new dimensions.

All of `test/api` passes locally (19/19).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fca1ee8a125e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.