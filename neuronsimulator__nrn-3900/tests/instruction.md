# Issue

**Title:** neuronapi: pointer to an object variable's element, given every index

## Description

There is no way through the C API to reach `Matrix.x[i][j]` (for `m._ref_x[i][j]`). The property accessors call the class's steer function without first pushing the indices and the array-dimension marker that `hoc_object_component` pushes, and `nrn_property_array_*` takes only one index. `Matrix`'s `steer_x` then raises "Array dimension of Matrix.x is 2".

New:
```c
int nrn_property_element_ptr(Object* obj, const char* name,
                             const int* indices, int nindex,
                             double** ptr, char* error_msg, size_t error_msg_size);
```
It pushes the indices and marker as HOC does and returns the element's address. It works for `Matrix.x`, `Vector.x`, `Pointer.val` and point-process scalars and 1-D arrays (via `point_process_pointer`). It returns nonzero with a message for an unknown name, a method, the wrong number of indices, an index out of range, an unset point-process POINTER, or a `Pointer` whose target was freed. Steer errors are caught through `OcJump::fpycall`, which restores the interpreter stack. Documented in `capi.rst`.

Test: `test/api/property_element_ptr.cpp` covers:
- `Matrix.x[1][2]`: read, write seen by HOC, last element, row out of range, wrong number of indices;
- `Vector.x[3]` (same address as `nrn_vector_data(vec) + 3`) and out of range;
- `Pointer.val`;
- `IClamp.amp`, `VClamp.amp[1]` (write seen by `nrn_property_array_get`), `VClamp.amp[3]` out of range;
- an unknown name and a method;
- failures leave the stack alone.

All of `test/api` passes locally (20/20); valgrind is clean on the new test.

Related, not changed here: `nrn_property_array_get/set/push` have the same missing push, so on `Vector.x` or `Matrix.x` they raise a HOC error (which terminates a caller that can't catch C++ exceptions). They work for point processes. I'll send that separately.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `07daa7f0b973`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.