# Issue

**Title:** oc: restore operand depth after top-level HOC errors

## Description

## What

Restore the entry operand-stack depth when `hoc_oc` catches a top-level
runtime error. This fixes repeated `nrn_hoc_call` failures without introducing
another public C API function.

## Why

Calling `nrn_hoc_call("execerror(\"boom\")")` repeatedly currently leaves an
operand behind each time. Around the configured stack limit, subsequent calls
report "Stack too deep" and can abort the process. Public PythonObject
component-provider failures expose the same problem for raw HOC reads,
method calls, assignments and indexed access.

Native Python's `h()` already uses an OcJump boundary that restores its stack.
Direct C API callers instead reach `hoc_oc`'s top-level catch, whose existing
`hoc_initcode()` cleans up interpreter frames and temporary objects but does
not remove leftover operands.

## Implementation

Record stack depth before the top-level `kernel()` call. After the existing
`hoc_initcode()` cleanup in its catch, pop operands back to that depth. Nested
calls keep propagating errors to their existing outer boundary. Successful
commands are unchanged.

The stack is private to `code.cpp`, so a small internal `hoc_stack_size()`
query is declared in `oc_ansi.h`; `neuronapi.h` is unchanged. The implementation
uses the existing `hoc_nopop()` rather than exposing the stack container or
adding another public error-handling API. `capi.rst` describes the return and
recovery behavior.

The ASan lane also exposed a pre-existing parser-symbol leak when nested
`execute(...)` fails: unwinding lost the outer statement's temporary symbol
list. A symlist-only scope guard in `hoc_ParseExec` now frees the current list
and restores the saved one on every exit; stack/frame recovery is unchanged.
The test redirects stderr to `/dev/null` only around its expected-failure loops
and restores it before reporting assertions, without using `execute1` or
changing the top-level error boundary.

## Test

`test/api/raw_hoc_errors.cpp`, added to the API CTest list, repeats each failing
path 1200 times: ordinary execerror, provider read, method, assignment, indexed
read, a failure holding a temporary Vector, and nested HOC execution. It checks
the exact integer/double sentinels below the command, stopped continuation,
temporary-Vector cleanup and an exact successful result afterward. The test
uses public component hooks and works without Python.

Both Release builds pass the complete API suite (18 tests each). The
Python-enabled build also passes all 41 registered `hoctests`, plus `ringtest`
and `connect_dend`: 61 selected CTests pass. The Python-disabled build passes
its 20 selected CTests (18 API plus those two HOC tests); upstream does not
register the `hoctests` group with Python disabled. InterViews, MPI and RxD
are disabled in these local builds, so this is not a whole-platform result.
The same regression linked against unmodified master `53de154d6` fails with
stack overflow. Formatting and diff checks pass.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `53de154d6130`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.