# Issue

**Title:** neuronapi: expose NMODL RANDOM objects

## Description

NMODL `RANDOM` variables have been usable from HOC and from the Python extension since #2627, but they are not reachable through the C API.

The wrappers that do the work — `nrn_nmodlrandom_wrap` and `nrn_pntproc_nmodlrandom_wrap` — take internal types (`Prop*`, `Point_process*`) and are exported C++-mangled only, so an external host cannot get at a RANDOM variable at all.

## The change

Two public adapters, taking only types `neuronapi.h` already exposes:

```c
Object* nrn_segment_nmodlrandom_get(Section* sec, double x, Symbol* sym);
Object* nrn_pntproc_nmodlrandom_get(Object* point_process, Symbol* sym);
```

A section plus position for the density case, the point-process `Object` for the point case. Each returns one owned reference.

Both **fail closed**: they return NULL for anything that is not a live NMODL RANDOM variable, rather than asserting or crashing. That is deliberate, and useful beyond safety — a caller can use a successful wrap as the runtime test for "is this symbol a RANDOM variable", which matters because there is no RANGEOBJ symbol to probe until a RANDOM-bearing mod file has been loaded.

Validation is load-bearing because the internal wrappers `assert` their preconditions. The adapters check symbol type and subtype, that the section is alive and `x` is in `[0,1]`, and for the point-process case that the symbol actually belongs to that template.

## Naming

These originally reused the names of the internal functions as C-linkage overloads. Renamed at review request, so the public adapters are `nrn_segment_nmodlrandom_get` / `nrn_pntproc_nmodlrandom_get` and the internal `nrn_nmodlrandom_wrap` / `nrn_pntproc_nmodlrandom_wrap` keep theirs. No identifier now means two different things.

## Test

`test/api/nmodlrandom.cpp` generates a density mod and a point-process mod that each declare a RANDOM variable, then checks exact sequence values, that passing the wrong symbol returns NULL rather than aborting, and that the returned object outlives the scope it was created in.

Verified on an `NRN_ENABLE_PYTHON=OFF` build: the full `api::` suite passes (16/16). `git diff --check` clean; pinned clang-format 12.0.1 / cmake-format 0.6.13 produce no changes.

Found while implementing type-320 dispatch in myneuron, which is currently the only piece of NEURON's range-variable surface it cannot reach.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `67fb8c6e8eaa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.