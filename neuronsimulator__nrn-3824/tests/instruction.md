# Issue

**Title:** neuronapi: add nrn_object_new_wrap to wrap a C++ payload as an object

## Description

Adds `nrn_object_new_wrap(Symbol\* sym, void\* cpp_object)` to the public C API.

## What and why

`nrn_object_new(Symbol\*, int narg)` runs a HOC constructor, pulling arguments off the stack. It cannot wrap a C++ object the caller already holds. The internal path for that is `hoc_new_object(Symbol\*, void\*)`, which allocates a HOC Object of a C++ (`CPLUSOBJECT`) template and stores the supplied pointer as its `this_pointer`.

This is the primitive behind wrapping a foreign C++ payload as a HOC object (for example a Python object, or an NMODL `RANDOM` state). Bindings that need it (myneuron's Python-object path, and equivalently other non-CPython consumers) currently reach for the C++-mangled `hoc_new_object` symbol because the public header offers only the constructor form. This adds the missing Python-free primitive.

## Changes

- `src/nrniv/neuronapi.h`, `src/nrniv/neuronapi.cpp`: declare and define `nrn_object_new_wrap`, a thin wrapper over `hoc_new_object`.
- `docs/capi.rst`: documented, cross-linked to `nrn_object_new` / `nrn_object_ref`.
- `test/api/object_new_wrap.cpp`: wraps a payload into a `SectionList` (an always-present C++ class) and reads it back through the public `nrn_sectionlist_data`, confirming the payload is stored as the object's backing pointer; also covers the null-payload (construct-then-fill) case. Registered in `test/api/CMakeLists.txt`.

Same structure as #3810. `make format-pr` clean (clang-format 12.0.1, cmakelang 0.6.13). The api test passes locally (`ctest -R object_new_wrap`).

Companion to #3823 (`nrn_object_ref_push`); the two are independent and can merge in either order.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5ac449d894df`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.