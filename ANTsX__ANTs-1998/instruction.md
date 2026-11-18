# Issue

**Title:** COMP: Replace deprecated vnl_fft_1d with itk::PocketFFTCommon in N3 filters

## Description

Replaces the deprecated `vnl_fft_1d` in the N3 bias-field filters' histogram-sharpening step with `itk::PocketFFTCommon::Transform1D`, **guarded by `__has_include` so ANTs builds against both new and old ITK**.

ITKv6 deprecates `vnl_fft_1d` (removed under `ITK_FUTURE_LEGACY_REMOVE`) and adds `itkPocketFFTCommon.h` in the same change. Since ANTs' pinned ITK may predate that header, a new `Utilities/itkN3SharpenFFT.h` helper selects the backend at compile time.

<details>
<summary>Backend selection + exact mapping</summary>

```cpp
#if defined(__has_include) && __has_include("itkPocketFFTCommon.h")
#  include "itkPocketFFTCommon.h"     // newer ITK
#else
#  include "vnl/algo/vnl_fft_1d.h"    // fallback: older ITK (no deprecation there)
#endif
```

`vnl_fft_1d` forward/inverse are unnormalized with the opposite sign convention from PocketFFT, so the PocketFFT branch uses `scale = 1` and maps `fwd_transform → forward=false`, `bwd_transform → forward=true` — identical to the migration ITK made in its own `itkN4BiasFieldCorrectionImageFilter`.
</details>

<details>
<summary>Equivalence + verification</summary>

- **Accuracy:** on ITK with PocketFFT, `N3BiasFieldCorrection` output — corrected image and estimated bias field — is **bitwise identical** to the `vnl_fft_1d` result across all 884,736 voxels of a synthetic bias-corrupted phantom (200 iterations, 4 fitting levels).
- **FFT-level:** a direct microbenchmark shows bit-identical forward transforms (`max|vnl − pocket| = 0`) at padded sizes N = 256 and N = 512; runtime within noise (pocket/vnl ≈ 1.0×).
- **Both preprocessor branches compile** (PocketFFT path and forced `vnl_fft_1d` fallback path both build cleanly).
</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d2fbf8bd525f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.