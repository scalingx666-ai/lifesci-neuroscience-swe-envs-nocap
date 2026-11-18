# Issue

**Title:** neuronapi: nrn_rangevar_push_nothrow, a pointer to a range-variable element

## Description

**Builds on #3899; only the last commit (2e23f9604) is new here.** It reuses the element lookup added there.

`nrn_rangevar_push` reads an array element's index from the interpreter stack behind an array-dimension marker, which no public call can push. So a caller without HOC code can't push a pointer to `xg[1]` or to a mechanism's `ca[0]` for `Vector.record`. On an array symbol it raises "array dimension of ... now 1 (at compile time it was 0)", which terminates a ctypes caller. It also raises a HOC error for an uninserted mechanism or an unset `POINTER`.

`nrn_rangevar_push_nothrow(sym, sec, x, index, error_msg, error_msg_size)`:
- takes the element index as an argument;
- uses the same lookup and checks as `nrn_rangevar_get_nothrow` (the lookup now returns the data handle, and the get/set paths are unchanged);
- pushes the data handle, so a recording follows the storage;
- returns an error code and message on failure, leaving the stack untouched.

Docs are in `capi.rst` next to the get/set pair.

Test: `test/api/rangevar_nothrow.cpp` now also pushes `xg[1]`, `vext[1]` and a scalar, writes through the popped pointer and reads the write back, checks that an out-of-range index fails, and checks that failures leave the stack alone. All of `test/api` passes (20/20); valgrind clean.

For context: the Python interface built on the C API needs this for `Vector.record(seg.cadifus._ref_ca[0])` (`nmodl_tests::test_kinetic`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `558e682f69d3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.