# Issue

**Title:** BUG: Value-initialize timeSeriesIndex in ReadWriteData conversions

## Description

Value-initializes the time-series index in the 4D/5D `ReadWriteData` conversion helpers. Surfaces as a GCC 14 `-Wmaybe-uninitialized` warning (via `itkImageHelper.h` offset computation).

<details>
<summary>Root cause</summary>

`ConvertTimeSeriesImageToFiveDimensionalImage` / `ConvertFiveDimensionalImageToTimeSeriesImage` declare the index uninitialized and assign only components `[0..3]`:

```cpp
typename TimeSeriesImageType::IndexType timeSeriesIndex;
timeSeriesIndex[0] = index[0]; ... timeSeriesIndex[3] = index[4];
```

When these templates instantiate with a 5-D index type, the trailing component is never set and is then consumed by `ImageBase::FastComputeOffset` in `Get/SetPixel`. Value-initializing (`... timeSeriesIndex{};`) zeroes the index before assignment.
</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d2fbf8bd525f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.