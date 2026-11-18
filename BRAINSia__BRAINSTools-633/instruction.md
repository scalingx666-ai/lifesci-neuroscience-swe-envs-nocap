# Issue

**Title:** ENH: Remove the OpenBLAS dependency from BRAINSSuperResolution

## Description

Removes the OpenBLAS dependency from `BRAINSSuperResolution`. Its only BLAS use was a `cblas_saxpy`/`cblas_sscal` pair in `AddAllElements` (`y = c*(a*x + y)` over contiguous float buffers), included via a bare `#include <cblas.h>` with no `find_package`, so the module built only where a BLAS happened to be on the include path. The same update is now a fused `Eigen::Map` expression over ITK's vendored Eigen, which `ITKCommon` already depends on. No new dependency; the module builds with no BLAS flags and links no BLAS library.

<details>
<summary>Performance</summary>

Micro-benchmark in one binary on the same buffers, median of 11 runs (Homebrew OpenBLAS 0.3 on an Apple M-series machine with clang):

| Buffer | OpenBLAS saxpy+sscal | Eigen fused | Eigen/BLAS |
|---|---|---|---|
| 3·64³ floats, 3 MB | 0.195 ms | 0.098 ms | 0.50 |
| 3·128³, 25 MB | 0.761 ms | 0.688 ms | 0.90 |
| 3·192³, 85 MB | 2.271 ms | 2.007 ms | 0.88 |

Eigen is faster at every size because BLAS has no fused scale-after-axpy primitive, so the old code made two passes over memory and the Eigen expression makes one. A plain autovectorized loop matches Eigen within 7%, confirming the gain is the pass count rather than the library.

End-to-end `OpWeightedL2` (24³ → 48³, 100 iterations): 0.64-0.69 s before and 0.62-0.67 s after. `AddAllElements` is under 2% of that run; the FFTs, gradient, and divergence dominate.

Numerics: max per-element difference 2.4e-7 (one float ulp, FMA ordering); the end-to-end image sum agrees to 4e-7 relative.

</details>

<details>
<summary>Commits</summary>

1. `STYLE:` move the buffer helpers from `OpWeightedL2.cpp` into `SRElementwiseOps.h` so they can be tested (no behavior change).
2. `ENH:` GTests pinning `AddAllElements` (scaling, unit-scale short-cut, output-buffer swap, covariant-vector components), `MultiplyVectors`, `Duplicate`, and an end-to-end `OpWeightedL2` regression on a synthetic blob with a pinned reference sum; plus the benchmark. All pass against the BLAS code at this commit.
3. `ENH:` the Eigen switch; also removes the `USE_BLAS_WRAPPERS` `#ifdef` and its unused ITK-filter branch, the commented-out Matlab and Armadillo CMake probes, and the BLAS path from the benchmark. The 7 tests pass unchanged.

`BRAINSSuperResolution` is off by default (`BUILD_FOR_DASHBOARD`), so CI does not build it; verified locally with `USE_BRAINSSuperResolution=ON`, which also pulls `Module_RTK` into ITK.

</details>

<details>
<summary>AI assistance disclosure</summary>

Claude Code (Fable 5.1) identified the BLAS call sites, drafted the Eigen replacement, the tests, and the benchmark, and ran the measurements. The author reviewed the change and ran the tests locally.

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e4f53583a22e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.