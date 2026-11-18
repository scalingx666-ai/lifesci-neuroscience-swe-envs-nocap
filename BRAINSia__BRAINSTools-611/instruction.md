# Issue

**Title:** COMP: Remove duplicate DTI reconstruction filter; use ITK's

## Description

Remove the local `itkDiffusionTensor3DReconstructionWithMaskImageFilter` (a 2011 fork of ITK's `itkDiffusionTensor3DReconstructionImageFilter`) and switch `gtractTensor` to ITK's filter.

ITK's filter is now a complete superset of the fork — mask support, multi-baseline averaging, and both gradient-image formats — so the fork is redundant. It also never did the ITK 5.0 `DynamicMultiThreading` migration, so it throws "Subclass should override" at `Update()` on any ITK ≥ 5.0; switching to ITK's filter restores a working code path.

<details>
<summary>Validation</summary>

ITK's filter builds against ITK 5.8 and ITK 6, and reconstructs **bit-identical** tensors on `gtractTensor`'s `SetGradientImage` (single-VectorImage) path across both versions. The only API gap is ITK's non-const `SetMaskImage`, handled with a `const_cast` (gtractTensor's mask comes from `GetBinaryImageROI()` as a `ConstPointer`). A companion ITK PR (InsightSoftwareConsortium/ITK#6482, with a 5.4 backport #6483) adds a single-image-path regression test and hoists the per-voxel SVD out of ITK's filter loop.
</details>

<!--
provenance: claude-code session 2026-06-20
files: GTRACT/Cmdline/gtractTensor.cxx (include + typedef + const_cast mask); deleted BRAINSCommonLib/itkDiffusionTensor3DReconstructionWithMaskImageFilter.{h,hxx}
related: InsightSoftwareConsortium/ITK#6482 (v6), #6483 (release-5.4)
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3e8e579435a1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.