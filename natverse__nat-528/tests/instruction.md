# Issue

**Title:** pointsinside() winding-number test via natcpp; macOS CI on CRAN binaries (v1.11.1)

## Description

## Summary

Point release **nat 1.11.1**.

- **`pointsinside()` now uses natcpp's generalised winding-number test** for logical results when natcpp (>= 0.3.2) is installed. The winding number (solid-angle) test does not depend on face normals, so it is robust to inconsistently oriented meshes that could previously give spurious inside/outside classifications with the normal-based `Rvcg` signed-distance test.
  - Runtime-conditional via an extended `use_natcpp(version=)`; natcpp stays in `Enhances:` with no version floor, so users without natcpp 0.3.2 are unaffected.
  - Hooked into the single `consistent_logical` funnel, so the `logical` path keeps its bounding-box pre-filter and only in-box points hit the winding-number test.
  - `Rvcg` remains the fallback and still serves `rval="distance"` and `rval="mesh3d"`. `options(nat.use_natcpp=FALSE)` forces the `Rvcg` path.
  - Verified locally: natcpp vs Rvcg agree 99.3% on `kcs20` (the difference is near-boundary robustness); existing hxsurf tests pass.

- **CI:** restrict `use-public-rspm` to Linux. P3M's macOS arm64 `Rvcg 0.25` binary currently fails to load (`symbol not found ___kmpc_dispatch_init_4u`, a missing `libomp` symbol), breaking macOS vignette rebuilding on master. macOS/Windows now fall back to CRAN's cleanly-linked binaries; Linux keeps the P3M speed-up.

Depends on natcpp >= 0.3.2 (released; also on r-universe). CI installs natcpp from `natverse/natcpp`.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ac2640950d2c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.