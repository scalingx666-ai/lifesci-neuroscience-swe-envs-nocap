# Issue

**Title:** neuronapi: resolve point-process POINTER properties through their data handle

## Description

. This is a bug fix to existing functions, not a new API addition.

## The problem

The six point-process property accessors resolve every member as ordinary `PARAMETER` storage:

```cpp
int index = sym->u.rng.index;
return ob2pntproc_0(const_cast<Object*>(obj))->prop->param_legacy(index);
```

An NMODL `POINTER` member does not live there. It lives in `prop->dparam[sym->u.rng.index]`. So reading one returned whatever double happened to occupy that parameter slot, and writing one corrupted a parameter instead of writing through the pointer.

Measured before the fix, with a `POINT_PROCESS` whose `POINTER vgap` was wired to another section's `v`, after `finitialize(-65)`:

```
nrn_property_get(pp,"vgap") = -0.106103     <- a parameter slot
actual source voltage v     = -65.000000
mechanism-computed i        = 0             <- wiring is correct; only the read was wrong
```

The mechanism's own `BREAKPOINT` computes `i = (vgap - v)/r = 0`, so the POINTER was wired correctly and the dereference inside the mechanism saw `-65.0`. Only the C-API read disagreed. Reading the same member through the Python extension returns `-65.0`.

This has been the behavior since the API was formalized in #2357; none of the recent additions touched these functions. It surfaced now because `nrn_pp_setpointer_pop` (#3828) made POINTER wiring reachable from the C API, so there was finally a reason to read one back.

## The change

Route all six through `point_process_pointer(Point_process*, Symbol*, int)`, which already branches on `sym->subtype == NRNPOINTER` and is what the interpreter path uses via `steer_point_process`. This makes the C API agree with HOC and the Python extension.

## Empty handles, and a question 

An unset or opaque `POINTER` yields an empty `data_handle`, and `data_handle::operator*` throws when dereferenced. That exception must not unwind out of a plain value-returning C function and across the ABI, which would terminate a ctypes or C caller. It is handled explicitly:

- reads return NaN
- writes are ignored
- pushes put the empty handle on the stack, which is what `steer_point_process` already does

I picked those because there is no error channel in `neuronapi.h` for a function returning a bare `double`. Worth noting the Python extension raises `ValueError: Invalid data_handle` for the same read, so it reports the condition rather than returning a sentinel. **If we would rather these signal an error than return NaN, that is a larger question about the value API's error model and I am happy to follow up separately.** I have documented the current choice as-is rather than assume it.

## Tests

The assertions are exact values, not absence of a crash:

- POINTER reads resolve to the referenced `feed` values on the two cross-wired `PPPtr` instances
- a write through a POINTER mutates the referenced storage rather than a parameter
- a pushed POINTER handle is consumed by `nrn_pp_setpointer_pop` to wire a second pointer to the same source, then both observe a change to it
- all six accessors are exercised against an unset POINTER
- the array forms are covered on the existing VClamp fixture, whose simulation expectation is unchanged

`api::setpointer_cpp` and `api::vclamp_cpp` pass. Run against the pre-fix library, the new assertions fail, so the coverage is not vacuous. clang-format 12 dry-run and `git diff --check` are clean.

Found while retiring myneuron's internal shims onto the public API.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `92d5758b6ade`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.