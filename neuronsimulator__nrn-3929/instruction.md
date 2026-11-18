# Issue

**Title:** neuronapi: harden the point-process branch of nrn_property_element_ptr

## Description

Found while auditing the C API functions ahead of the next round of interface work.

`nrn_property_element_ptr` (#3900) is documented to report errors in `error_msg`, not raise them. Its point-process branch called `point_process_pointer` with no checks, so three inputs escaped:

- A point process with no section (`new IClamp()`, or one whose section was deleted) raised the HOC error "point process not located in a section". A plain C caller gets `std::terminate`.
- A method name such as `loc`, `get_loc` or `has_loc` was treated as a RANGEVAR. It threw `std::runtime_error` "could not translate legacy index".
- A `make_pointprocess` template variable was looked up through `sym->u.rng` and returned a pointer to a different variable (asking for `b` gave `a`).

The branch now checks that the symbol is a RANGEVAR and that the point process has a `prop` before calling `point_process_pointer`, and reports the failure like the other errors. A `make_pointprocess` variable is now reported as "variables of a make_pointprocess template are not supported" instead of returning the wrong element, and the docs list that failure. Supporting HOC template variables here would be a separate change. Asking for the first variable of such a template used to return the right pointer, since `a` and `b` both mapped to `a`; it now fails too.

Steer errors (Matrix or Vector index out of range, freed Pointer) were already caught and reported in `error_msg`. But `hoc_execerror` had printed the full HOC message to stderr first, for example "Matrix index out of range: index=3 max_index=2 / near line 0". With more than one MPI rank it would also call `nrnmpi_abort` before throwing (hoc.cpp:625-629). The steer call now runs with `hoc_execerror_messages` and `nrn_mpiabort_on_error_` turned off, as `hoc_execute1` does, and both are restored afterwards. A test captures stderr around two steer errors and asserts it is empty, and a later HOC error still prints. The MPI part is from reading the code; it has not been run on 2 ranks.

The `quiet_fpycall` helper is also added by the `nrn_property_data_handle_is_valid` PR, identically. Whichever lands second drops its copy.

Tests (test/api/property_element_ptr.cpp): an unlocated IClamp and one on a deleted section return nonzero with "not located in a section" and leave the stack unchanged; `loc`, `get_loc` and `has_loc` return "not a variable"; a `make_pointprocess` variable returns nonzero with a NULL pointer and that message. On master the test aborts at the first new check. All test/api tests pass, and valgrind reports no errors on this test.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a0f7a943088d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.