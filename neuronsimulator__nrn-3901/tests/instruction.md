# Issue

**Title:** neuronapi: nrn_property_array_* reach Vector.x[i]

## Description

Uses the steer helper `nrn_property_element_ptr` added in #3900 (now merged). Merged with master, including #3888's HOC-template branch in the same functions, which is unchanged.

`nrn_property_array_get/set/push` and `nrn_property_data_handle_is_valid` call a C++ class's steer function without first pushing the index and array-dimension marker that HOC pushes. On `Vector.x` they raise "array dimension of x now 1 (at compile time it was 0)", which terminates a caller that can't catch C++ exceptions. They have only worked for point processes (e.g. `VClamp.amp[i]`). Same on released nightlies; this code is unchanged since the API was added in #2357 (`nrn_property_data_handle_is_valid`, #3858, copied the pattern).

Fix: the C++-class branch goes through the same helper `nrn_property_element_ptr` uses, with the one index:
- `Vector.x[i]` now reads, writes, pushes and validates element `i`;
- a scalar (`Pointer.val`) keeps the old behavior;
- `Matrix.x` (two dimensions) has no element `i`, so these functions treat it like an invalid point-process handle: get returns NaN, set does nothing, push pushes a null pointer and the data handle is not valid, instead of popping an index that isn't there. `nrn_property_element_ptr` is the way to reach it.

Point-process handling is untouched. Docs note added under `nrn_property_array_get`. This doesn't overlap #3888, which adds a separate branch for HOC templates at the top of these functions.

Test: `test/api/property_array_steer.cpp` covers get/set/push/data-handle on `Vector.x`, an index out of range, all four on `Matrix.x`, and point-process arrays unchanged. It aborts on the unfixed library and passes here; all of `test/api` passes (25/25 after merging master), valgrind clean.

Also: an index outside `Vector.x` or `NetCon.weight` made the steer function raise a HOC error that escaped the C API and left the index on the HOC stack. These functions now check the index against the array size first and treat it like an invalid handle (NaN, no-op, null pointer, not valid), with nothing printed and no MPI abort. Negative indices are out of range too; before, -1 read element 0. The test checks the stack depth and that stderr stays empty, and adds `NetCon.weight`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `00cbbfc44877`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.