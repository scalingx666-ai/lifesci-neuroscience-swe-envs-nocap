# Issue

**Title:** neuronapi: add nrn_object_new_nothrow for error-reporting construction

## Description

Adds `nrn_object_new_nothrow(Symbol* sym, int narg, Object** result, char* error_msg, size_t error_msg_size)`.

## What and why

`nrn_object_new` calls `hoc_newobj1`, which throws a C++ exception when the HOC constructor errors (bad arguments, a failing `INITIAL`, a template `init` that calls `execerror`, ...). For a non-C++ consumer of the API (ctypes, MATLAB) that exception propagates across the FFI boundary, which is undefined behavior. The public API already has `nrn_function_call_nothrow` and `nrn_method_call_nothrow` for exactly this reason; construction was the one call with no nothrow variant.

`nrn_object_new_nothrow` catches the error and reports it: returns 0 with `*result` set on success, nonzero with `*result == NULL` and `error_msg` populated on failure.

## Changes

- `src/nrniv/ocjump.{h,cpp}`: add `OcJump::newobj_throw_on_exception`, which runs `hoc_newobj1` under the same `saved_state` + `try_catch_depth_increment` guard as `execute_throw_on_exception`, so the interpreter stack is restored if construction fails.
- `src/nrniv/neuronapi.{h,cpp}`: `nrn_object_new_nothrow`, wrapping that helper in the standard nothrow try/catch (same shape as `nrn_function_call_nothrow`).
- `docs/capi.rst`: documented, cross-linked to `nrn_object_new` / `nrn_function_call_nothrow`.
- `test/api/object_new_nothrow.cpp`: success path (Vector(3)), failure path (a template whose `init` calls `execerror` — caught, returns nonzero, nulls `*result`, fills the message), a stack-hygiene check (a value pushed after a failed construction pops back cleanly, proving the stack was restored), and NULL-error-buffer tolerance on both paths. Registered in `test/api/CMakeLists.txt`.

Shape approved by @ramcdougal (email). Same structure as #3810. `make format-pr` clean (clang-format 12.0.1, cmakelang 0.6.13); `ctest -R object_new_nothrow` passes, full `api::` group green.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `61cb128d873b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.