# Issue

**Title:** neuronapi: report array-dimension markers as STACK_IS_INT

## Description

. `nrn_int_pop` accepts array-dimension markers, but
`nrn_stack_type` currently throws `std::runtime_error("get_legacy_int_type")`
when one is on top. That breaks the documented probe-before-pop pattern.

`nrn_stack_type` now checks for the marker first and reports it as
`STACK_IS_INT`. The change stays inside the API; core's `get_legacy_int_type`
is unchanged. No new public function or enum value is needed. The docs note
that both integer representations can be inspected and consumed through the
existing API.

The test replaces the internal `hoc_push_ndim` producer with a genuine indexed
HOC component access through `nrn_function_call_nothrow`. A component hook
installed with the public `nrn_template_set_component_hooks` (#3859) probes and
pops the runtime's real dimension marker, then returns a deliberate provider
error. The test verifies one- and two-dimensional values, preservation of that
error, the restored object argument, released owned references, and lower
stack sentinels. It runs without Python. The unrelated pre-existing symbol-pop
test still uses `hoc_pushs`.

Validation:

- The updated test linked against the unfixed core exits nonzero on the
  marker-type, marker-value, and error checks for both indexed expressions.
  The enclosing nothrow call catches the accessor exception; this reproducer
  demonstrates the wrong error, not a process abort.
- Release build with `NRN_ENABLE_PYTHON=OFF`: all 18 `api::` CTests pass.
- Upstream C++ formatter and `git diff --check` pass.

The same public integer API now supports both probing and popping.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `82241e0fa972`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.