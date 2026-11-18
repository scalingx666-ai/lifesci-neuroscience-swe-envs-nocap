# Issue

**Title:** Recompute 3d-derived diam in nrn_segment_diam_get

## Description

## What

Makes `nrn_segment_diam_get` return the 3d-derived segment diameter even before
an explicit geometry pass. When a section's geometry comes from `pt3dadd`, NEURON
derives the segment diam from those points lazily, and the getter now triggers
that recompute if it's pending.

## Why

When geometry is defined by 3d points, NEURON rewrites the segment diam from
those points lazily, gated per-section on `recalc_area_`. `nrn_segment_diam_get`
read the range-variable pointer without checking that flag, so a diam read after
`pt3dadd` (before `define_shape` or `finitialize`) returned a stale default
rather than the 3d-derived value. The Python getter already does this recompute
(`nrnpy_nrn.cpp`), so this brings the C API in line and removes a foot-gun for
the MATLAB, C++, and ctypes consumers of the header.

## Implementation

Mirror the range-variable read path: if the section has a pending recompute, run
it before reading.

```c
if (sec && sec->recalc_area_) {
    nrn_area_ri(sec);
}
```

Uses the per-section `recalc_area_` flag and `nrn_area_ri`, not the global
`diam_changed` / `recalc_diam`. `recalc_diam` rebuilds the whole solver matrix
over every section (heavy, surprising from a getter) and asserts `!tree_changed`,
so it can abort if called before topology is set up. Staleness is per-section,
which is why the normal read paths guard on `recalc_area_`.

## Test

`test/api/segment_diam.cpp` builds a section with two 3d points of diameter 10,
so diam is 10 everywhere, and checks `nrn_segment_diam_get` returns 10 both before
any geometry pass (the fix) and after `finitialize`. Documented in `capi.rst`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4a478b1ee23b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.