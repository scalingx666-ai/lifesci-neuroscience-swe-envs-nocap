# Issue

**Title:** neuronapi: add nrn_setpointer_pop / nrn_pp_setpointer_pop for POINTER wiring

## Description

Adds `nrn_setpointer_pop` (density mechanisms) and `nrn_pp_setpointer_pop` (point processes) to the public C API, so an NMODL `POINTER` can be wired from a non-CPython consumer.

## What and why

Wiring an NMODL `POINTER` to a source (gap junctions, any POINTER coupling) has no public primitive. The HOC `setpointer` statement and Python's `seg.mech._ref_PTR = src._ref_X` both do it, but the only internal entry point is `nrn_pointer_assign`, which takes a `PyObject*` and lives in libnrnpython, unreachable from a ctypes / MATLAB / C++ consumer. Those bindings currently route through a HOC `setpointer` string shim.

The source is **pushed onto the stack** (per the earlier review): pushing it rather than naming it reuses every existing way of obtaining a pointer (`nrn_rangevar_push`, `nrn_property_push`, ...) and keeps the API to a single "wire the popped pointer" call per target kind. The pushed source is consumed even on the error paths, so the stack is left balanced.

## Density vs. point process

Density and point-process assignment converge on the **same** slot write -- `prop->dparam[sym->u.rng.index] = <data handle>`, the assignment `nrn_pointer_assign` performs. They differ only in how the target `Prop` is resolved, and that difference is why they cannot be one function:

- **Density** (`nrn_setpointer_pop`): addressed by `(sec, x)`. A density mechanism has exactly one instance per segment, so the segment names it. There is no per-instance object to hand in.
- **Point process** (`nrn_pp_setpointer_pop`): addressed by the **instance object**. Several point processes may share one location (two HalfGaps at one segment), so `(sec, x)` is ambiguous; the object is what disambiguates. `nrn_pp_setpointer_pop(Object* pp, const char* name, ...)` resolves the POINTER by bare name in the point process's own symbol table -- the same lookup `nrn_property_get` uses -- and reaches the `Prop` via `ob2pntproc_0`.

## Changes

- `src/nrniv/neuronapi.h`, `src/nrniv/neuronapi.cpp`: declare + define both functions.
- `docs/capi.rst`: documented both. The `nrn_setpointer_pop` example previously used a HalfGap, which is a `POINT_PROCESS` and would not actually work with the density path -- fixed to a density mechanism; the HalfGap example now lives on `nrn_pp_setpointer_pop`, cross-referenced.
- `test/api/setpointer.cpp`, `test/api/ptrtest.mod`, `test/api/ppptrtest.mod`: no built-in mechanism has a POINTER, so the test generates minimal fixtures with nocmodl and compiles them in (the same codegen path nrniv uses for built-ins; the mod codegen is refactored into a `foreach` over both fixtures). `ptrtest` (density) exercises `nrn_setpointer_pop`; `ppptrtest` (a `POINT_PROCESS`) exercises `nrn_pp_setpointer_pop` with **two instances at one location**, cross-wired HalfGap-style -- each `src` pointed at the other instance's `feed`. After `finitialize` they read back distinct values (20 and 10), which segment addressing could not produce. Both error paths (non-POINTER target, absent/mislocated mechanism) and stack balance are checked for each.

Same structure as #3810. `make format-pr` clean (clang-format 12.0.1, cmakelang 0.6.13). `ctest -R setpointer` passes; the full `api::` group is green.

This retires myneuron's HOC `setpointer` shim (and the equivalent MATLAB detour) for both mechanism kinds.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5ac449d894df`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.