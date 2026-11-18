# Issue

**Title:** COMP: Fix GCC build warnings in BRAINSCommonLib and GTRACT

## Description

## Summary

Fixes 20 compiler warnings detected on Ubuntu/GCC by the new
`report_build_diagnostics.py` CI step (PR #584).  macOS/Clang was clean;
all warnings were GCC-specific.

### Warnings fixed

| File | Line | Flag | Fix |
|------|------|------|-----|
| `BRAINSCommonLib/BRAINSFitHelperTemplate.hxx` | 1150 | `-Wshadow` | Rename local `using IdentityTransformType` → `LocalIdentityTransformType` to avoid shadowing the class member typedef |
| `GTRACT/Cmdline/gtractResampleFibers.cxx` | 245 | `-Wunused-result` | Capture `[[maybe_unused]] const bool` return value of `TransformPhysicalPointToIndex` (marked `nodiscard` in ITK 5.x) |
| `GTRACT/Common/itkDtiGuidedTrackingFilter.hxx` | 362, 377, 389 | `-Wunused-result` | Same: `TransformPhysicalPointToContinuousIndex` |
| `GTRACT/Common/itkTensorInterpolateImageFunction.h` | 92 | `-Wunused-result` | Same |
| `GTRACT/Common/itkDtiFastMarchingCostFilter.h` | 121 | `-Wmaybe-uninitialized` | Add in-class initializer `m_Axis{0}` |

### Test excluded

`BRAINSFitTest_ScaleTranslationRescaleHeadMasksNoInit` added to CI exclusion.
Same GCC/Clang floating-point divergence class as `BRAINSFitTest_RigidRotationNoMasks`
(passes on macOS Clang with ImageError=0, fails on Ubuntu GCC).

## AI disclosure

Warnings identified from PR #584 CI log.  Fixes written with Claude Code
(Sonnet 4.6) and verified to compile locally on macOS arm64.  Per
BRAINSTools policy this PR is opened as ready for review (not draft)
since the changes are mechanical.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1f806670d546`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.