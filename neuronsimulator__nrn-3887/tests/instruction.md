# Issue

**Title:** neuronapi: release HOC's deferred temporary after nothrow calls

## Description

HOC keeps the temporary object behind an expression like `vec.c.x[0]` alive in a deferred slot (`hoc_pop_defer`) until the next statement starts. NEURON's Python interface releases it after every call with `hoc_unref_defer()` (`nrnpy_hoc.cpp`). The nothrow C API calls did not, so the temporary outlived the call. In an interface built on the C API, that showed up as objects surviving `del`, and as a double free in `PreSyn::~PreSyn` when a NetCon was destroyed after its source.

`nrn_function_call_nothrow` and `nrn_method_call_nothrow` now call `hoc_unref_defer()` before returning, on success and on error. The result on the stack has its own reference and is unaffected. `capi.rst` documents the behavior.

Test: `test/api/deferred_unref.cpp` counts Vector instances after a function call and a method call that each evaluate `src.c.x[1]`. Both checks fail without the fix. All of `test/api` plus the unit tests pass locally (22/22).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9cb05746c4ec`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.