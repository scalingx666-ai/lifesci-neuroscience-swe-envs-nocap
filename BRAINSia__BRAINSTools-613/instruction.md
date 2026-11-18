# Issue

**Title:** BUG: Zero-initialize accumulation buffers in gtractAverageBvalues

## Description

Fixes a correctness bug in `gtractAverageBvalues`: the accumulation buffer was allocated without initialization, so averaged b-value directions were computed from uninitialised heap memory and the written NRRD was non-deterministic. Found with Valgrind memcheck.

<details>
<summary>Root cause</summary>

`itk::VectorImage::Allocate()` defaults to `Allocate(false)` — it does **not** zero the pixel buffer. The averaging loop then accumulates into that uninitialised buffer:

```cpp
avgImage->Allocate();                                   // buffer is garbage
...
NrrdAvgImageType::PixelType vectorImagePixel = ot.Get();          // reads uninitialised
vectorImagePixel[currentIndex] += static_cast<AvgPixelType>(it.Value());  // += onto garbage
ot.Set(vectorImagePixel);
```

Every averaged direction is therefore offset by whatever was left in the freshly-allocated heap block, and the result changes run to run. `outputImage` had the same missing initialization. Fixed by allocating both with `Allocate(true)` (zero-initialized).
</details>

<details>
<summary>Valgrind analysis (before → after)</summary>

Built BRAINSTools at `-O0 -g` and ran `GTRACTTest_gtractAverageBvalues` under `valgrind memcheck --track-origins=yes` with ITK's suppressions.

**Before** — the error count hit valgrind's cap:
```
ERROR SUMMARY: 10000000 errors from 101 contexts
   60 Conditional jump or move depends on uninitialised value(s)
   39 Use of uninitialised value of size 8
Uninitialised value was created by a heap allocation
   at itk::VectorImage<float,3>::Allocate(bool) (itkVectorImage.hxx:48)
   by gtractAverageBvaluesTest(int, char**) (gtractAverageBvalues.cxx:169)
```

**After** — `ERROR SUMMARY: 0 errors from 0 contexts`; the test still passes its baseline comparison.
</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `07bdec3a840c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.