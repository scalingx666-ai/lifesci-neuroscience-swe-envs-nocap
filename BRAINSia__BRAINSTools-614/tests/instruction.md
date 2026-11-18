# Issue

**Title:** BUG: Fix out-of-bounds gradient-vector access in DWIConverter::OrientForFSLConventions

## Description

Fixes a heap buffer overflow (out-of-bounds read **and** write) in `DWIConverter::OrientForFSLConventions`, found with Valgrind memcheck. The diffusion gradient-vector flip indexed the 4-D image axes into 3-component gradient vectors, corrupting adjacent memory.

<details>
<summary>Root cause</summary>

```cpp
for (size_t i = 0; i < Volume4DType::ImageDimension; ++i)   // 4-D image → i = 0..3
{
  ... arrayAxisFlip[i] = ...;                               // 4-element FlipAxesArray: OK
  for (auto & m_DiffusionVector : this->m_DiffusionVectors) // each is vnl_vector_fixed<double,3>
    m_DiffusionVector[i] *= (arrayAxisFlip[i] ? -1 : 1);    // i==3 → OOB read+write
}
```

The image `FlipImageFilter` axis array legitimately spans the 4 image dimensions, but the diffusion gradient vectors are **3-dimensional**. At `i == 3`, `m_DiffusionVector[3]` reads and writes 8 bytes past the end of every gradient vector — and past the end of the `std::vector<vnl_vector_fixed<double,3>>` buffer — corrupting adjacent heap memory. Guarding the gradient-vector flip to the 3 spatial axes (`if (i < 3)`) leaves the 4-D image flip unchanged.
</details>

<details>
<summary>Valgrind analysis (before → after)</summary>

Built BRAINSTools at `-O0 -g` and ran the FSL read path (`--conversionMode FSLToNrrd`) under `valgrind memcheck --track-origins=yes`.

**Before** (`DWIConvertGeSignaHdx*` tests):
```
Invalid write of size 8
   at DWIConverter::OrientForFSLConventions(bool) (DWIConverter.cxx:109)
   by FSLDWIConverter::ExtractDWIData() (FSLDWIConverter.cxx:49)
 Address 0x... is 0 bytes after a block of size 888 alloc'd
   ... std::vector<vnl_vector_fixed<double,3u>> ... DWIConverter::ReadGradientInformation
```
(paired `Invalid read of size 8` at the same site.)

**After** — the `FSLToNrrd` conversion runs through `OrientForFSLConventions` with **no `Invalid read`/`Invalid write`** and `ERROR SUMMARY: 0 errors`.
</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7f5bd904cd4f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.