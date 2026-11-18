# Issue

**Title:** neuronapi: property access on HOC template objects, incl. objrefs

## Description

`nrn_property_get`/`set` and the array, push and data-handle variants call `ctemplate->steer`, which only built-in (C++) classes have. On an object of a `begintemplate` class they jump through a null pointer and segfault: reading `cell.x` from a template with `public x` crashes on master.

For HOC template objects they now read and write the object's dataspace, for any double member, public or not. The Python interface also allows non-public reads, and NEURON's tests rely on that (e.g. `cell.rpp`). A name that is not a double member, or an out-of-range index, reads NaN and is not written. Built-in classes and point processes are unchanged.

Two new functions do the same for `objref` members:
- `nrn_property_object_get(obj, name)`: borrowed, as with `nrn_symbol_object_get`.
- `nrn_property_object_set(obj, name, value)`: releases the old object and retains the new one; `NULL` makes the member nil.

Both are documented in `capi.rst`.

Test: `test/api/template_property.cpp` covers public and non-public scalars, an array element, pointers, invalid names and indices, objref get/set/clear (checked from HOC too), and built-in classes. All of `test/api` plus the unit tests pass locally (23/23).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `82241e0fa972`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.