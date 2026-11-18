# Issue

**Title:** pointsinside(): take distance sign from natcpp winding number

## Description

## Summary

. When natcpp (>= 0.3.2, Enhances) is available, `pointsinside(rval="distance")` and `rval="mesh3d"` now combine:

- the **unsigned** closest-point distance from `Rvcg::vcgClostKD(sign=FALSE)` (purely geometric), with
- the **sign** from natcpp's generalised winding-number test.

Rvcg derives the sign from the normal of a single closest face, which is unreliable near edges, vertices and thin features. On `kcs20` vs `MB_CA_L`, 73 points ~36 µm outside the calyx (all outside its bounding box — the "red points in the vertical lobe" in the example) were previously reported as inside. `distance >= 0` now agrees exactly with `rval="logical"`; distance magnitudes are unchanged. Cost is ~20% extra for `rval="distance"`.

All natcpp use is behind the internal `inside_winding()` helper, which returns `NULL` unless `use_natcpp(version='0.3.2')`, so the pure Rvcg path is used when natcpp is absent or `options(nat.use_natcpp=FALSE)`.

## Changes

- `R/hxsurf.R`, `man/pointsinside.Rd`, `NEWS.md`: implementation and docs (also tempers the face-orientation robustness claim: winding numbers handle globally inverted meshes, not mixed orientation).
- Tests: new `with_and_without_natcpp()` helper runs `pointsinside()` tests on both paths; natcpp-specific tests check sign/logical agreement, bbox consistency, unsigned magnitude, and an inverted tetrahedron.
- CI: new ubuntu release job **without natcpp** (asserts it is absent) to exercise the fallback paths in tests/examples/vignettes.

## Test plan

- [x] `test-hxsurf.R` passes locally with natcpp
- [ ] CI including the new no-natcpp job

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bf02188df358`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.