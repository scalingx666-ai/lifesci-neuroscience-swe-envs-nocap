# Issue

**Title:** ENH: Port Tier 1+2 tests to GTest (PrettyPrintTable, Slicer3LandmarkIO, AverageImageFilter, BlendImageFilter)

## Description

## Summary

GTest ports for four BRAINSCommonLib Tier 1+2 tests (issue #403):

- **PrettyPrintTableGTest**: 6 assertions covering `PrettyPrintTable::Print()` and `BRAINSTools::Version` API
- **Slicer3LandmarkIOGTest**: 2 `EXPECT_THROW` cases for non-existent path handling
- **AverageImageFilterGTest**: pixel-wise accuracy vs manual average (EXPECT_NEAR on min/max/mean of difference image)
- **LocaleSafeConversionsGTest**: 121 cases (already present from base branch)

Also removes four legacy CTest source files and their CMakeLists.txt entries, now superseded by the GTest equivalents.

**Depends on #591** (ITKv5 `itkBlendImageFilter` migration) — this PR is retargeted to `enh/itk5-blend-filter-threading` and will be rebased to `main` once #591 merges.

## What changed vs original commits

The original `ff02e25f` commit included a `DynamicMultiThreadingOff()` workaround in `itkBlendImageFilter.hxx`. That workaround is now removed: PR #591 performs the proper ITKv5 migration to `DynamicThreadedGenerateData`, and this PR builds cleanly on top without touching the filter implementation.

## Test plan

- [x] All 5 GTest binaries build without warnings (Debug, Apple Clang, arm64)
- [x] `BlendImageFilterGTest`: 1/1 PASSED
- [x] `PrettyPrintTableGTest`: 6/6 PASSED
- [x] `AverageImageFilterGTest`: 1/1 PASSED
- [x] `Slicer3LandmarkIOGTest`: 2/2 PASSED
- [x] `LocaleSafeConversionsGTest`: 121/121 PASSED

## AI Disclosure

Branch restructuring, cherry-pick conflict resolution, and CMakeLists.txt edits assisted by Claude Sonnet 4.6. All code reviewed and test results verified locally by the author.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ac0955ae1383`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.