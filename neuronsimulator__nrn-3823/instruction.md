# Issue

**Title:** neuronapi: add nrn_object_ptr_push for writable objref arguments

## Description

Adds `nrn_object_ref_push(Object\*\* obj_ref)` to the public C API.

## What and why

`nrn_object_push(Object\*)` pushes an object by value, which is fine for read-only arguments. It cannot express the *out-parameter* idiom, where a callee assigns to its `$oN` argument and the value is written back into the caller's object reference (HOC's `h.ref(obj)` / `foo(objref_var)` pattern). Internally that path goes through `hoc_pushobj(Object\*\*)`, which pushes the writable cell rather than the object.

Bindings that need this (myneuron's `h.ref(obj)` support, and equivalently the MATLAB interface) currently reach for the C++-mangled `hoc_pushobj` symbol because the public header exposes only the by-value push. This adds the missing Python-free primitive so no consumer has to bind an internal symbol.

## Changes

- `src/nrniv/neuronapi.h`, `src/nrniv/neuronapi.cpp`: declare and define `nrn_object_ref_push`, a thin wrapper over `hoc_pushobj`.
- `docs/capi.rst`: documented with a C usage example, cross-linked to `nrn_object_push` / `nrn_object_unref`.
- `test/api/object_ref_push.cpp`: exercises both directions. Write-back (a proc that does `$o1 = new Vector(3)` updates the caller's cell) and read (HOC reads `$o1.size()` through the pushed cell). Registered in `test/api/CMakeLists.txt`.

Same structure as #3810. `make format-pr` clean (clang-format 12.0.1, cmakelang 0.6.13). The api test passes locally (`ctest -R object_ref_push`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `61cb128d873b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.