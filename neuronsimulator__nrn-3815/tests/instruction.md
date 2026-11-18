# Issue

**Title:** Add nrn_global_double_get/set for top-level HOC scalars

## Description

## What

Adds `nrn_global_double_get` / `nrn_global_double_set` to `neuronapi.h`: read
and write a top-level HOC scalar by value, handling every `VAR` subtype.

## Why

`nrn_symbol_dataptr` returns `sym->u.pval`, which is only valid for `USERDOUBLE`
scalars. A `NOTUSER` runtime scalar (created in HOC by e.g. `x = 42`) stores its
value in the top-level object-data array, not at `sym->u.pval`, so a caller that
dereferences the returned pointer reads an offset-as-pointer and segfaults;
`USERINT` / `USERFLOAT` globals are likewise misread as doubles. Consumers of the
public header (the myneuron ctypes binding, the MATLAB interface) currently work
around this with a `hoc_ac_` interpreter trampoline.

## Implementation

Subtype-aware get/set that mirror the interpreter's own per-subtype dispatch in
`oc/code.cpp`: `USERDOUBLE` at `sym->u.pval`, `USERINT`/`USERFLOAT` at their
typed pointers, and `NOTUSER` via `hoc_top_level_data[sym->u.oboff].pval` — plus
the `(int)(value + hoc_epsilon)` rounding for the `USERINT` write. Both return
nonzero for anything that isn't a global scalar (null, non-`VAR`, an array, or a
section-level property). `nrn_symbol_dataptr` is left unchanged; its doc now
points here.

## Test

`test/api/global_scalar.cpp`: a `NOTUSER` round-trip including a HOC cross-check
that the write lands where HOC itself reads, a `USERDOUBLE` round-trip, and the
error contract (null and non-`VAR` symbols). Documented in `capi.rst`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4f53d26802ad`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.