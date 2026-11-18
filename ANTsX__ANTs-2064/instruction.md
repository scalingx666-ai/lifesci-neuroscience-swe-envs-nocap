# Issue

**Title:** COMP: Compute determinants through itk::bridge on ITK 6

## Description

: compute those four determinants through `itk::bridge::Math::Determinant` on ITK 6 instead of the `vnl/algo/vnl_determinant.h` it added, which ITK 6 deprecates. Also includes `vnl_diag_matrix.h` in `ConvertTransformFile`, which MSVC needs.

<details>
<summary>Why the include from #2063 is not enough</summary>

On ITK main, `vnl/algo/vnl_determinant.h` is a deprecation shim: it emits a warning under `ITK_LEGACY_REMOVE` (always defined in ITK 6; `#pragma message` on MSVC) and an `#error` under `ITK_FUTURE_LEGACY_REMOVE`, naming `itk::bridge::Math::Determinant` as the replacement. ITK 5.4 has no bridge header.

`Utilities/antsDeterminant.h` defines `ants::Determinant(m)`: it calls `itk::bridge::Math::Determinant` when `__has_include("itkBridgeMathDeterminant.h")` and `vnl_determinant` otherwise. The eight call sites in `ImageMath_Templates.hxx`, `antsTransformInfo.cxx`, `itkAverageOverDimensionImageFilter.hxx` and `itkPreservationOfVectorDirectionImageFilter.cxx` call it as `::ants::Determinant`, since `itk::ants` also exists. The bridge has overloads for `itk::Matrix`, `vnl_matrix` and `vnl_matrix_fixed`, which covers every argument type used here.

`ConvertTransformFile.cxx` uses `vnl_diag_matrix` without its header; GCC and Clang reach it through ITK headers, MSVC with ITK main does not (`'vnl_diag_matrix': undeclared identifier`).

</details>

<details>
<summary>Testing</summary>

- Linux (conda GCC 14.3), this branch: ANTs builds and 185/185 tests pass against ITK main and against ITK release-5.4.
- Windows (MSVC 14.44, Visual Studio 18, Ninja), the same change on dcdaf421: ANTs builds against ITK main; before it, `itkPreservationOfVectorDirectionImageFilter.cxx` (`vnl_determinant`) and `ConvertTransformFile.cxx` (`vnl_diag_matrix`) failed.

</details>

<details>
<summary>AI assistance</summary>

Claude Code found the failures on the Windows build, wrote the helper, and ran the Linux and Windows builds and tests.

</details>

<!--
provenance: claude-code session 2026-11-07, Windows sccache forest D:\S-sc (engr-d-coe138-2)
remaining: other deprecated vnl/algo uses in ANTs (vnl_svd, vnl_symmetric_eigensystem, vnl_real_eigensystem, ...) still warn on ITK 6; see itk_forest_build_testbed skill itk-dual-version-compat
-->

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `58b0d8d8c73d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.