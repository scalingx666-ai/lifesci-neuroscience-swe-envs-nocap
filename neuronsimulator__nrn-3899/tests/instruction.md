# Issue

**Title:** neuronapi: diam and xraxial writes through nrn_rangevar_set update the section

## Description

The nothrow get/set this PR started with went in through #3905, which was stacked on it. What's left is the fix from review: a `diam` or `xraxial` write through `nrn_rangevar_set` or `nrn_rangevar_set_nothrow` didn't do the bookkeeping a HOC or Python assignment does.

- `diam`: sets `diam_changed`, `sec->recalc_area_` and calls `nrn_diam_change(sec)`, so the area (and 3-d points) follow the new diameter. Before, `area()` kept the old value.
- `xraxial`: sets `diam_changed`, so the axial terms are recomputed.

Both setters go through one helper. Documented in `capi.rst`.

Test: `test/api/rangevar_nothrow.cpp` writes `diam` on a fresh section through each setter and checks `area(0.5)` against pi·d·L. It fails without the fix. All of `test/api` passes locally (23/23).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dbd7575730da`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.