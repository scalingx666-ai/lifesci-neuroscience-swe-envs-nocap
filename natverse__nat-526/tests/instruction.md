# Issue

**Title:** Cache thin plate spline coefficients in xformpoints.tpsreg

## Description

## Summary
- `tpsreg()` now stores a `digest` of `(refmat, tarmat, lambda)` and an explicit `lambda` field, so the cached identity of a registration is well-defined.
- `xformpoints.tpsreg()` looks up the Morpho `tpsCoeff` in a session-level cache keyed by that hash plus direction, computing on miss via `Morpho::computeTransform` + `Morpho::applyTransform` rather than `Morpho::tps3d` (which always re-solves). This eliminates the per-call ~1s solve seen when running `nlapply(neurons, xform, reg=tpsreg)` over many neurons.
- Old `tpsreg` objects without `$hash` still work — the hash is recomputed on the fly. Both `swap=TRUE` and `swap=FALSE` directions are cached independently, computed lazily on first use.
- Added a `threads` arg to `xformpoints.tpsreg()` for completeness with the underlying Morpho calls.
- Updated roxygen for `tpsreg`/`xformpoints.tpsreg` to describe the caching behaviour in `@details`.

## Test plan
- [x] `devtools::test(filter="xformpoints")` — 14/14 pass, including the existing roundtrip that exercises both `swap=FALSE` and `swap=TRUE` on the same reg
- [ ] Manual benchmark on a real ~1000-neuron `nlapply` workload to confirm the speedup

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cf82fad17fe7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.