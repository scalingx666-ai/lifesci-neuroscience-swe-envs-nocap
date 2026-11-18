# Issue

**Title:** BUG: Fix lossy vector rescale in ReadVectorVolume (null image, dead loops)

## Description

Fixes `ReadVectorVolume` crashing with a null-pointer dereference when
`DWIConvert --allowLossyConversion` reads a non-short NRRD, and adds a test
that reproduces it.

<details>
<summary>Cause</summary>

In the lossy-conversion branch of `ReadVectorVolume`
(`DWIConvert/DWIConvertUtils.hxx`):

- Both loops ended on `it.IsAtEnd()` instead of `!it.IsAtEnd()`, so neither
  the min/max scan nor the rescale ran.
- The output image was reset to null before the loop and never reallocated,
  so building the output iterator dereferenced null. The visible symptom is a
  segfault.
- `dmax` was seeded with `NumericTraits<double>::min()`, the smallest positive
  double, so all-negative data scanned wrong.
- A constant image gave `scale = 1/0`, an undefined cast to short.

The branch is reached by `NRRDDWIConverter::LoadFromDisk` with
`allowLossyConversion` on a float, int, or uchar NRRD. The one test caller,
`NrrdToNIfTI.cxx`, passes `allowLossy=false`, so nothing covered it.

</details>

<details>
<summary>Change and test</summary>

- Loop conditions corrected, `dmax` seeded with `NonpositiveMin()`, and
  `scale` is 0 when `dmax <= dmin`.
- The output is allocated from the input (`CopyInformation`, metadata
  dictionary, vector length, region), so b-values, gradients, and the
  measurement frame carry over.
- New `ReadVectorVolumeGTest`: writes a 2x2x2, two-component float NRRD and
  reads it back lossy. Data in [-10, 30] must map the minimum to 0 and the
  maximum to 32766, with size, spacing, and vector length preserved. Constant
  data must give 0.
- On the old code the test exits with a segfault (rc 139). With the fix, both
  cases pass.
- The expected values come from the scaling formula, not from a run of the
  old code, which crashed.

</details>

<details>
<summary>Local verification</summary>

- macOS, Release, DWIConvert-only inner build: 265 of 265 tests pass with the
  test data fetched, including the two new cases.
- `pre-commit run --all-files` exits 0.
- Not run: the full `DWIConvert` command line on a real float NRRD, the
  all-negative-data case, Linux, and CI.
- The rescale truncates rather than rounds. That is unchanged.

</details>

<!--
provenance: claude-code session 2026-11-01, written by a subagent and
  reviewed in the main session
related_files: DWIConvert/DWIConvertUtils.hxx,
  DWIConvert/TestSuite/ReadVectorVolumeGTest.cxx,
  DWIConvert/TestSuite/CMakeLists.txt
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1dd8452bc0f0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.