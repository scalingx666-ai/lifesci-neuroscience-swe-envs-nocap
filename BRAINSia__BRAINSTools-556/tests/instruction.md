# Issue

**Title:** PERF: Pre-allocate ListSample outside per-voxel loop in GeneratePurePlugMask

## Description

## Summary

- Moves `SampleType::New()` out of the per-voxel loop in `GeneratePurePlugMask` so the ITK object factory is invoked **once** instead of ~581,000 times per EM iteration.
- `BRAINSABCSmallTest` wall time: **138.9 s → 76.8 s (−45%)**
- All 311 tests pass after this change.

## Root Cause

The `sample` profiler showed 93.8% of `EMSegmentationFilter::EMLoop()` time was spent inside `GeneratePurePlugMask`, with 98.7% of *that* in `itk::Statistics::ListSample::New()`. The ITK object factory performs O(N_registered_types) string comparisons per `::New()` call (~2000 types). With ~581K voxels per EM iteration, this produced hundreds of millions of wasted string comparisons.

```
47301  EMSegmentationFilter::EMLoop()
  44940  GeneratePurePlugMask(...)               ← 94.8%
    44366  itk::Statistics::ListSample::New()    ← 98.7%
      43842  itk::ObjectFactoryBase::CreateInstance(char const*)
```

## Fix

```cpp
// BEFORE — one factory lookup per voxel:
while (!maskIt.IsAtEnd()) {
    SampleType::Pointer sample = SampleType::New();   // inside loop
    sample->SetMeasurementVectorSize(numberOfImageModalities);
    ...
}

// AFTER — allocate once, reset per iteration:
SampleType::Pointer sample = SampleType::New();       // outside loop
sample->SetMeasurementVectorSize(numberOfImageModalities);
while (!maskIt.IsAtEnd()) {
    sample->Clear();
    ...
}
```

## Test Plan

- [x] `BRAINSABCSmallTest` passes (76.8 s vs 138.9 s baseline)
- [x] Full 311-test suite passes with no regressions
- [x] Profiled under macOS `sample` to confirm factory call elimination

## AI Disclosure

This change was identified by running `macOS sample` profiling under a `BUILD_PROFILING=ON` build and analyzing the call tree. The fix pattern (hoist `::New()` + call `->Clear()` inside loop) was suggested by Claude Sonnet 4.6. The change was verified by running the test suite.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `73274a8570ee`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.