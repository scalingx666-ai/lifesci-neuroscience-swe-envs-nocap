# Issue

**Title:** neuronapi: retain before release in the objref setters

## Description

Found while auditing the C API functions ahead of the next round of interface work.

`nrn_symbol_object_set` (#3830) and `nrn_property_object_set` (#3888) released the old object before retaining the new one. If the old object held the only reference to the new one, the new object was freed and then stored in the slot. That happens when a slot is assigned its current value, or an object that only the old value keeps alive (an element of a `List` being replaced, or a member of the template object being replaced). The result is a dangling objref and a refcount increment on freed memory; on glibc the next allocation aborts with `malloc(): unaligned tcache chunk detected`.

The fix retains the new object first and then releases the old one, the same order as `hoc_obj_set` in `src/oc/hoc_oop.cpp`.

`nrn_property_object_set` had a second problem of the same kind. If the member's old value held the last reference to the object being assigned to (`obj.m = obj` with nothing else referencing `obj`), releasing the old value freed `obj` and its objref storage. The new value was then written into freed memory and its reference never released. The setter now writes the cell before releasing the old value. If that release frees `obj`, freeing its members releases the new value too. `obj` itself is never ref'd or unref'd, so a template's `unref()` procedure gets the same calls and counts as for HOC's `a.m = x`. Holding `obj` would run `unref()` on every member set, and MulRunFitter and CellBuild act on that count. Assigning a slot its current value is now a no-op in both setters, as `a.m = a.m` and `o = o` are in HOC.

Tests: `test/api/symbol_object_string.cpp` and `test/api/template_property.cpp` now assign a slot its own sole-referenced Vector, and an object kept alive only through the old value (a List element for the top-level objref, a template member for the template objref). They check the binding, the number of live Vectors and the Vector size seen by HOC. Without the fix both tests abort at the first check after the self-assignment. `template_property.cpp` also builds that self-cycle, assigns the member a new Vector, and checks that the owner is freed and the Vector is released with it. Without the second fix that check fails because the Vector leaks, and the test then aborts. It also checks the `unref()` calls of a logging template. For a member set, self-assignment, and releasing a member that holds its owner, they must match HOC's for the same assignment. In the last-reference case there must be one `unref(0)` and then the owner is freed. With both fixes the tests pass and valgrind reports no errors.

The docs in `docs/capi.rst` already describe the HOC assignment semantics and need no change.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a0f7a943088d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.