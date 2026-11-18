# Issue

**Title:** neuronapi: add nrn_symbol_pop; make nrn_object_pop nil-safe

## Description

Adds `nrn_symbol_pop` to the public C API and makes `nrn_object_pop` nil-safe.

## What and why

Unwinding an interpreter stack frame from a binding -- the HOC-to-Python component read/write-back path (`pyobj.attr`) -- needs a symbol pop the public API does not provide, and needs the object pop to tolerate a nil `objref`. Without both, a consumer (myneuron, and equivalently the MATLAB interface) reaches for the C++-mangled internals instead.

```c
Symbol* nrn_symbol_pop(void);
Object* nrn_object_pop(void);  // now returns NULL on a nil objref instead of crashing
```

- **`nrn_symbol_pop`** wraps `hoc_spop`. The interpreter leaves the attribute's `Symbol` on the stack during object-component access, and unwinding that frame has to pop it. There is no public counterpart today.

- **`nrn_object_pop` nil-safe.** Previously it unconditionally did `(*obptr)->refcount++` to hand back a reference, which dereferences `NULL` when the stack entry is a nil `objref` (an unset `objref` right-hand side in a write-back, for example). It now guards that single ref and returns `NULL` for a nil object. This is strictly more permissive: identical for a real object, `NULL` instead of a segfault for nil. Per review, this replaces the earlier separate `nrn_object_pop_safe` -- the crashing behavior was not useful to any caller, so there is no reason to keep a safe copy beside it. A non-`NULL` result is still reference-counted and should be released with `nrn_object_unref`.

## Changes

- `src/nrniv/neuronapi.h`, `src/nrniv/neuronapi.cpp`: declare `nrn_symbol_pop`; fold the nil guard into `nrn_object_pop`.
- `docs/capi.rst`: documented `nrn_symbol_pop`, and noted the nil-safe return on `nrn_object_pop`.
- `test/api/stack_pops.cpp`: pushes symbols and pops them LIFO (checking `nrn_stack_type` reports `STACK_IS_SYM`), round-trips a real object through `nrn_object_pop`, and confirms a nil `objref` pops to `NULL` rather than crashing, with the stack left balanced.

Same structure as #3810. `make format-pr` clean (clang-format 12.0.1, cmakelang 0.6.13). `ctest -R stack_pops` passes; the `api::` group (12 tests) is green.

These are the last stack primitives needed to finish the HOC-to-Python read/write-back for the no-libnrnpython case without binding mangled symbols.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e99f020e201e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.