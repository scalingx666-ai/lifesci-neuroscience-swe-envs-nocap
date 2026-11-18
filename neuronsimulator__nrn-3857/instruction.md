# Issue

**Title:** neuronapi: expose array-dimension stack pop

## Description

Indexed object-component access leaves a dedicated array-dimension marker on the HOC stack. That marker is not a `USERINT`, so an external host cannot consume it with `nrn_int_pop`, and the only matching operation was the C++-mangled `hoc_pop_ndim` (`src/oc/code.cpp:933`). That leaves indexed component access unreachable through the public C API.

This adds `nrn_ndim_pop()` as a one-function public wrapper, declared alongside the other stack pops.

## Test

`test/api/stack_pops.cpp` pushes two markers and checks exact values in LIFO order (push 2 then 7, pop 7 then 2), and keeps the existing sentinel-below-the-frame assertion so a pop that consumed the wrong slot fails rather than passing quietly. The docs note that the marker is a distinct stack value and cannot be popped with `nrn_int_pop`.

Verified on an `NRN_ENABLE_PYTHON=OFF` build: the full `api::` suite passes (15/15), `git diff --check` is clean, and the pinned clang-format 12.0.1 / cmake-format 0.6.13 produce no changes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `67fb8c6e8eaa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.