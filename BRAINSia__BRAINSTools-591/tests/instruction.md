# Issue

**Title:** ENH: Migrate itkBlendImageFilter to ITKv5 DynamicThreadedGenerateData

## Description

## Summary

Migrates `itkBlendImageFilter` from the ITKv4-style `ThreadedGenerateData(region, threadId)` API to the ITKv5 `DynamicThreadedGenerateData(region)` API, enabling true load-balanced multi-threading via the TBB backend.

## Changes

### `itkBlendImageFilter.h`
- Declare `DynamicThreadedGenerateData` instead of `ThreadedGenerateData`
- Simplify constructor to `= default` — the previous user-defined body existed solely to call `this->DynamicMultiThreadingOff()`, which was a workaround for the old signature

### `itkBlendImageFilter.hxx`
- Remove `#include "itkProgressReporter.h"` — the ITKv5 dynamic multi-threader tracks progress automatically; per-pixel `CompletedPixel()` calls and the `threadId` parameter are both gone
- Remove the now-empty constructor definition
- Rename `ThreadedGenerateData` → `DynamicThreadedGenerateData` and drop `ThreadIdType threadId`
- Consolidate the three `GoToBegin()` calls and `while` loop into a single `for` loop

### `BRAINSABC/TestSuite/BlendImageFilterGTest.cxx` + `CMakeLists.txt`
- Add GTest port of `BlendImageFilterTest` (previously commented out behind `BRAINSTools_MAX_TEST_LEVEL > 8`) to provide permanent, named test coverage

## ITKv5 Migration Guide reference

From [ITK 5.0 Migration Guide](https://github.com/InsightSoftwareConsortium/ITK/blob/master/Documentation/docs/migration_guides/itk_5_migration_guide.md):

> ITK 5.0 introduces a new default signature for filter multi-threading, `DynamicThreadedGenerateData`, which replaces the classic `ThreadedGenerateData` signature. Filters can opt-out of the new behavior or use the classic model if specific conditions (constant threads, `threadId` usage, custom region splitting) are met.

`itkBlendImageFilter` has none of those conditions — it is a straightforward pixel-by-pixel map — so full migration to `DynamicThreadedGenerateData` is both correct and beneficial.

## Test plan

- [x] `BlendImageFilter.BlendWeightsProduceCorrectPixelValues` passes locally (Debug, Apple Clang, arm64)
- [x] 42/42 GTest cases pass (full `LocaleSafeConversions` + `BlendImageFilter` suite)
- [x] `BRAINSABCTestDriver` builds without warnings (filter is also instantiated in `EMSegmentationFilter.hxx`)
- [x] CI passes on Ubuntu (GCC) and macOS (Clang)

## AI disclosure

Migration authored with Claude Sonnet 4.6 assistance, referencing the ITK 5 migration guide via Context7 MCP.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b374e97bcf54`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.