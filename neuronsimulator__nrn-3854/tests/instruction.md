# Issue

**Title:** neuronapi: complete the zero-diam recompute without a HOC error

## Description

Fixes a crash in an existing API function: `nrn_segment_diam_get` can terminate the calling process when a section has a non-positive segment diameter.

This is a bug fix to an existing function, not a new API addition.

## First: this does not touch the spine convention

The obvious worry on reading the title is that NEURON uses a negative diameter to flag a spine, so treating a non-positive diameter as an error would break that. It would, but this PR is in a different branch of the function and never sees a spine.

`nrn_area_ri` splits on whether the section has a 3d point list:

| | `sec->npt3d > 1` | `sec->npt3d <= 1` |
|---|---|---|
| Path | `diam_from_list()` | the `else` at `treeset.cpp:788` |
| Reads | `sec->pt3d[j].d` (the 3d points) | `p->param(0)` (the `diam` range variable) |
| Negative value means | **a spine** (`NTS_SPINE`, `options.h:22`) | nothing; there is no convention here |
| Handling | `fabs()` everywhere, negatives counted into `nspine` | `diam <= 0` clamped to `1e-6` |
| Can it raise? | **no** | yes, `hoc_execerror`, and it already does today |

A morphology with spines has a 3d point list, so it goes through `diam_from_list`, which takes the absolute value of every point diameter and never calls `hoc_execerror`. This PR does not modify `diam_from_list`.

The error this PR deals with is in the stylized-geometry branch, where `diam` is the range variable itself and a non-positive value has been an error for as long as the function has existed:

```c
auto& diam = p->param(0);
if (diam <= 0.) {
    diam = 1e-6;
    hoc_execerror(secname(sec), "diameter diam = 0. Setting to 1e-6");
}
```

**Nothing that was legal before becomes an error here.** The clamp, the threshold and the message are all unchanged. What changes is only who the report can safely reach.

## The problem

`nrn_segment_diam_get` triggers the pending per-section area/resistance recompute (added in #3814) so a `diam` read reflects 3d-derived geometry. Inside that recompute, `nrn_area_ri` clamps a non-positive diameter to `1e-6` and then reports the adjustment with `hoc_execerror`, which is a C++ exception in this NEURON.

A plain value-returning C accessor cannot let that exception unwind across its ABI. It reaches a caller with no matching handler, for example a ctypes or C reader of `seg.diam`, and the process terminates. The clamp itself is a recoverable adjustment, not a fatal condition.

## Why catching it is not enough

Wrapping the `nrn_area_ri` call in a `try`/`catch` looks sufficient but is not. The raise happens inside the per-segment loop, so unwinding out of it leaves the remaining segments unclamped, area and resistance only partly recomputed, and the trailing `diam_changed` update skipped. The section is then in a half-recomputed state with `recalc_area_` still pending.

## The change

Factor the body into `nrn_area_ri_impl(sec, report_diam_error)`:

- `nrn_area_ri` keeps its current behavior for HOC and interpreter callers, diagnostic included, so nothing user-visible changes there.
- `nrn_segment_diam_get` uses a new internal entry point `nrn_area_ri_no_diam_error`, which applies the same clamp and completes the same recompute without raising.

`nrn_area_ri_no_diam_error` is declared in the internal `src/nrnoc/nrn_ansi.h`, not in `neuronapi.h`, so the public API surface is unchanged.

## Test

`test/api/segment_diam.cpp` sets all three segments of a section to diameter 0 and reads the **last** segment first, then verifies every segment reads `1e-6`. An implementation that only catches the first clamp error fails on the unclamped remainder, so the test distinguishes the two approaches rather than just checking that nothing crashed.

`api::segment_diam_cpp` passes; the test file is already wired into `test/api/CMakeLists.txt`. clang-format 12 dry-run and `git diff --check` are clean.

Found while running myneuron against 9.0.2, where a zero-diameter section aborted the interpreter instead of returning the clamped value.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `67fb8c6e8eaa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.