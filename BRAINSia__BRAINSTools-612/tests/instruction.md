# Issue

**Title:** ENH: Use Eigen-backed itk::SymmetricEigenAnalysis; drop OpenBLAS dep

## Description

Replace the LAPACK-backed `vnl_symmetric_eigensystem` in
`EdgeBasedWeightedTV/itkDivergenceImageFilter` with the header-only,
Eigen-backed `itk::SymmetricEigenAnalysisFixedDimension`, removing
BRAINSTools' **only** external BLAS/LAPACK/ATLAS link dependency.

**AI assistance:** drafted with Claude Code (code analysis, the edit, and the
local build/test runs below). I reviewed the change and the results and am
accountable for the code; the AI-generated portion is the two-file diff and the
test snippet shown below.

<details>
<summary>What changed</summary>

- `itkDivergenceImageFilter.h`: the symmetric metric-tensor eigenvalues (2×2/3×3,
  edge strength = largest − second-largest eigenvalue) now come from
  `itk::SymmetricEigenAnalysisFixedDimension` (internally
  `Eigen::SelfAdjointEigenSolver`) instead of `vnl_symmetric_eigensystem`.
  Eigenvalue ordering (ascending) is preserved, so results are identical.
- `EdgeBasedWeightedTV/CMakeLists.txt`: drop the `LinAlgSelector.cmake` include
  and `${LINALG_LIBRARIES}` link.
</details>

<details>
<summary>Why</summary>

`vnl_symmetric_eigensystem` lives in `vnl/algo`, which is LAPACK-backed;
`LinAlgSelector` therefore required an external OpenBLAS/LAPACK/ATLAS. That call
was the sole BLAS/LAPACK consumer in the tree, so this removes the dependency
outright. ITK already bundles Eigen and exposes it via
`itk::SymmetricEigenAnalysis`, so no new dependency is added. For the small
fixed-size matrices the closed-form Eigen path also avoids LAPACK call overhead.
</details>

<details>
<summary>Local testing — ITK 5.4.6 and ITK 6 (origin/main)</summary>

Compiled the exact new code path (`SymmetricEigenAnalysisFixedDimension` over a
`vnl_matrix`) against both a built ITK 5.4.6 and a built ITK 6, via
`find_package(ITK COMPONENTS ITKCommon)`:

```
3x3 diag(1,2,3): 1 (expect 1)
2x2 [[2,1],[1,2]]: 2 (expect 2)
PASS ALL
ldd: no libblas / liblapack / libopenblas  (BLAS-free)
```

Both ITK versions: builds, numerically identical edge-strength, and the linked
binary pulls in no BLAS/LAPACK. (The full `BRAINSSuperResolution` SuperBuild
target is independently gated on `USE_ITKMatlabIO`/Matlab, unrelated to this
change, so the changed translation unit was verified in isolation against both
ITK versions rather than through the SuperBuild.)
</details>

<details>
<summary>Follow-up (not in this PR)</summary>

`CMake/LinAlgSelector.cmake` and `CMake/Find{OpenBLAS,LAPACKE,ATLAS}.cmake` are
now unreferenced and could be removed in a separate cleanup.
</details>

<!--
provenance: claude-code session 2026-06-23; testbed itk_forest_build_testbed
change: BRAINSSuperResolution/EdgeBasedWeightedTV (itkDivergenceImageFilter.h + CMakeLists.txt)
verified_itk: v5.4.6 and origin/main (ITK6); BLAS-free via ldd; eig-diff identical
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ff4c121a4265`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.