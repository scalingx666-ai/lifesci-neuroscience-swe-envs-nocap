# Issue

**Title:** COMP: Initialize members read before being set (Valgrind uninitialised-value)

## Description

Initializes two class members that were read before being set, each flagged by Valgrind memcheck as "conditional jump or move depends on uninitialised value(s)". Both are `itkSetMacro`-generated setters comparing the new argument against a never-initialized member.

<details>
<summary>Root cause</summary>

**`RegistrationHelper::m_RegistrationRandomSeed`** — declared `int m_RegistrationRandomSeed;` with no initializer and absent from the constructor initializer list. `SetRegistrationRandomSeed(int)` (via `itkSetMacro`) evaluates `if (_arg != m_RegistrationRandomSeed)`, and the seed is also tested as `if (m_RegistrationRandomSeed != 0)`, both reading the uninitialised member. Fixed with an in-class initializer `{ 0 }` (0 = "no fixed seed", matching the existing `!= 0` guard).

**`WarpImageMultiTransformFilter::m_EdgePaddingValue`** — the constructor's initialization was commented out, leaving the `PixelType` (an `itk::Vector`, whose default constructor does not zero its storage) uninitialised. `SetEdgePaddingValue(PixelType)` then compares against it. Restored `m_EdgePaddingValue = NumericTraits<PixelType>::ZeroValue();`.
</details>

<details>
<summary>Valgrind analysis (before → after)</summary>

Built ANTs at `-O0 -g` (so results are not optimizer artifacts) and ran the full test suite under `valgrind memcheck --track-origins=yes --leak-check=no` with ITK's suppressions.

**Before:** 32 tests reported these defects. Representative origins:

```
Conditional jump or move depends on uninitialised value(s)
   at ants::RegistrationHelper<double,3>::SetRegistrationRandomSeed(int) (itkantsRegistrationHelper.h:776)
   ...
 Uninitialised value was created by a heap allocation
   at ants::RegistrationHelper<double,3>::New() (itkantsRegistrationHelper.h:461)
```
```
Conditional jump or move depends on uninitialised value(s)
   at itk::Vector<float,1>::operator!=(...) (itkVector.h:247)
   by itk::WarpImageMultiTransformFilter<...>::SetEdgePaddingValue(...) (itkWarpImageMultiTransformFilter.h:211)
 Uninitialised value was created by a heap allocation
   at itk::WarpImageMultiTransformFilter<...>::New() (itkWarpImageMultiTransformFilter.h:99)
```

**After:** the two representative tests (one per pattern) report `Defects: 0`. No functional behavior changes (the members are only read after being explicitly set in normal use; this fixes the read-before-set on the default path).
</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d2fbf8bd525f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.