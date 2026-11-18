# Issue

**Title:** BUG: Fix UseROIBSpline failure with missing primary input

## Description

## Summary

- Fixes the `UseROIBSpline` crash in BRAINSFit that produces VTK/ITK error: **"Input Primary is required but not set."**
- The root cause is in `BRAINSCommonLib/BRAINSFitHelperTemplate.hxx` where the `ResampleImageFilter` for the moving mask was only fully configured (SetInput, SetTransform, Update) inside the `m_CurrentGenericTransform.IsNotNull()` conditional block
- When BSpline registration runs without a prior Rigid/Affine stage (so no initial transform exists), the resampler has no input set, causing the pipeline error

## Investigation Details

### Code path (`BRAINSFitHelperTemplate.hxx`, ~line 1129)

When `m_UseROIBSpline` is true and `m_MovingBinaryVolume` is non-null:

1. A `ResampleImageFilter` is created to resample the moving mask into fixed image space
2. **Before fix:** `SetInput()`, `SetTransform()`, `SetOutputParametersFromImage()`, and `Update()` were ALL inside the `if (m_CurrentGenericTransform.IsNotNull())` block
3. If `m_CurrentGenericTransform` was null (e.g., BSpline-only registration, or failed prior stage), the resampler was left unconfigured
4. Downstream code at lines ~1155 and ~1161 called `resampler->GetOutput()` regardless, triggering the "Input Primary is required but not set" error from ITK's pipeline validation

### Fix

- Moved `SetInput()`, `SetOutputParametersFromImage()`, and `Update()` outside the conditional
- Added an `else` branch that sets an `itk::IdentityTransform` when no prior transform exists
- This ensures the resampler always has a valid transform and input, correctly mapping the moving mask onto the fixed image grid

### Test coverage

The existing test at `BRAINSFit/TestSuite/CMakeLists.txt` (line ~1628) exercises `--useROIBSpline` with `--transformType Rigid,Affine,BSpline`, which should still pass since the prior Affine stage provides the transform. The previously-failing scenario (BSpline-only or null transform) is now handled correctly.

## Test plan

- [ ] Verify existing `BRAINSFitTest` with `--useROIBSpline` still passes
- [ ] Test with `--transformType BSpline` only (no prior Rigid/Affine) plus `--useROIBSpline` to confirm the fix
- [ ] Confirm no regression in standard BSpline registration without ROI

## AI Disclosure

This investigation and fix were produced with Claude Code (Claude Opus 4.6). The analysis identified the bug by tracing the code path in `BRAINSFitHelperTemplate.hxx` where the `ResampleImageFilter` conditional configuration left the filter without a primary input. The fix was reviewed for correctness against ITK API conventions. Local compilation has not been verified.

Addresses #292.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `335bb3cf5b07`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.