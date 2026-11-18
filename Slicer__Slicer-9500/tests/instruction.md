# Issue

**Title:** BUG: Fix test failures caused by ARM floating-point and compression differences

## Description

Fixes three tests that fail only on the macOS arm64 nightly. The outputs differ from x86 at the bit level even though both are valid.

### 1. `CastScalarVolumeTest_UnsignedInt`: undefined behavior when casting negative values

`CastScalarVolume` used `itk::CastImageFilter`, which converts each value with `static_cast`. The float test input ranges from -127 to 127, and half of its voxels are negative. Converting a negative float to an unsigned integer type is undefined behavior in C++:
- On x86, the value wraps around (for example -2 becomes 4294967294), which is what the old baselines contain.
- On ARM, `unsigned int` conversion clamps to 0, so all 131,072 negative voxels differed from the baseline.

`UnsignedChar` and `UnsignedShort` passed on ARM only because the compiler converts those types through a signed 32-bit integer, which happens to wrap the same way.

Fix: use `itk::ClampImageFilter`, which clamps values outside the output type's range to its minimum or maximum on all platforms. The CLI description now says so.

> [!NOTE]
> **This changes `CastScalarVolume` output on x86.** Negative values cast to an unsigned type now become 0 instead of wrapped-around values. Values within the output type's range are unchanged.

New `UnsignedChar`, `UnsignedShort` and `UnsignedInt` baselines are uploaded to the `SHA256` release of Slicer/SlicerTestingData, and their `.md5` links are replaced with `.sha256` links. The other five baselines are unchanged.

### 2. `MergeModelsTestCompare`: byte-for-byte comparison of compressed files

The test compared the output `.vtp` file with the baseline using `cmake -E compare_files`. The model content is identical on arm64: the same points, cells and normals. But the zlib-compressed `Normals` array is 8 bytes shorter, because zlib-ng selects CPU-specific compression code. The byte comparison also broke before when VTK 9.6 changed the `.vtp` XML header (92042b6af6).

Fix: add a `CompareModels` function to the MergeModels test driver. It reads both models and compares points, cells, and point and cell data arrays with a `1e-6` tolerance. The test script now uses it instead of comparing bytes.

### 3. `vtkAddonMathUtilitiesTest1`: exact comparison of a computed scale

The test compared a scale recovered with a square root against the original value using an exact comparison, which fails on arm64 because the result differs in the last bits. Fixed in Slicer/vtkAddon#77; this PR updates the vtkAddon version used by Slicer to include it.

```
$ git shortlog 3dc6d63..09bff3b
Alexy Pellegrini (1):
      COMP: Use vtkCellArray::GetCellAtId instead of GetCell.

Sam Horvath (1):
      BUG: Use a tolerance when checking computed column scales (#77)
```

### Testing

All checks ran on the macOS arm64 dashboard machine. The modified code was compiled separately with the dashboard's compile and link settings, without modifying the dashboard build. Slicer has not yet been fully built with these changes.

- **CastScalarVolume:** Ran the real `CastScalarVolumeTest` driver, loading a rebuilt CLI library, for all 8 output types.
  - All 8 match the expected clamped values computed independently with NumPy.
  - The 5 unchanged baselines pass.
  - The 3 new baselines pass with the clamp. With the original cast, `UnsignedChar` and `UnsignedShort` still fail.
  - The uploaded baselines download from SlicerTestingData with matching SHA256 hashes.
- **vtkAddon:** Compiled `vtkAddonMathUtilitiesTest1` against the dashboard's vtkAddon and VTK. Without the fix it fails at line 247 as on the dashboard; with the fix, all subtests pass.
- **MergeModels:** Rebuilt the `MergeModelsTest` driver and ran the updated `run_MergeModelsTest.cmake`.
  - Passes against the existing baseline, even though the file bytes still differ.
  - Fails, reporting the mismatch, for a model with one point moved by 0.01.
  - Fails, reporting the mismatch, for a model with one normal value changed.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0f1a35116e99`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.