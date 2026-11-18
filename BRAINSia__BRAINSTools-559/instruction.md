# Issue

**Title:** ENH: Add macOS profiling infrastructure (sample-based, stub scripts, MIH/MMI report)

## Description

## Summary

Adds a complete macOS performance profiling toolkit built on the `sample` CLI tool bundled with Xcode Command Line Tools.

- **`BUILD_PROFILING` CMake option** in `Common.cmake` — adds `-fno-omit-frame-pointer -fno-optimize-sibling-calls -g` without the 10–20× Debug slowdown; extracted to `Utilities/cmake/BRAINSToolsInstrumentation.cmake`
- **`bt-configure-inner.sh`** extended with `--cmake-args` and `--name-suffix` to support a named Profiling inner build alongside Release
- **`bt-profile-tests.sh`** — orchestrates `sample`-based profiling of slow tests, prints top-N hotspot call table
- **Per-test stub scripts** in `bt-profile-stubs/` — each stub is a self-contained bash script defining the test command; selectable via `--stub NAME`
- **`bt-mih-vs-mmi-report.sh`** — runs `MIHAffineRotationMasks` with both MIH and MMI metrics, generates an HTML report with embedded JS convergence chart
- **`.gitignore`** updates for CTest/BRAINSFit/BRAINSABC runtime artifacts

## Stub scripts included

| Stub | Test profiled |
|------|--------------|
| `brainsabc-small.sh` | BRAINSABCSmallTest |
| `brainsfit-mih-affine.sh` | BRAINSFitTest_MIHAffineRotationMasks |
| `brainsfit-bspline-rescale.sh` | BRAINSFitTest_BSplineOnlyRescaleHeadMasks |
| `bcd-landmark-compare.sh` | BCDTestForLandmarkCompare |

## Usage

```bash
# Configure a Profiling inner build
Utilities/build_configs/inner/bt-configure-inner.sh \
    --type Release --name-suffix Profiling --cmake-args "-DBUILD_PROFILING=ON"

# Profile all registered tests
Utilities/misc/bt-profile-tests.sh --output-dir /tmp/bt-profiles

# Profile a single test
Utilities/misc/bt-profile-tests.sh --stub BCDTestForLandmarkCompare

# Generate MIH vs MMI HTML comparison report
Utilities/misc/bt-mih-vs-mmi-report.sh --build-dir <inner-build-dir>
```

## Notes

- This PR targets `enh/slicer-debug-build-config-and-test-script` because it extends `bt-configure-inner.sh` which was introduced there.
- After PR #552 merges, this can be retargeted to `main`.
- macOS only — uses `sample` CLI, not cross-platform.

## AI Disclosure

Profiling infrastructure designed and implemented with Claude Sonnet 4.6. Stub pattern, HTML report template, and hotspot parsing logic are AI-generated. Scripts have been tested on Apple M-series (macOS 26.3.1).

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1544abc8f26c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.