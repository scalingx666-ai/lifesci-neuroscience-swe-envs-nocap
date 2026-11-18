# Issue

**Title:** COMP: Build BRAINSTools with MSVC and without ITK 6's deprecated vnl_svd

## Description

Lets BRAINSTools build with MSVC on Windows and stop using the `vnl_svd` that ITK 6 deprecates, while still building against ITK 5.4. Three commits: drop a GCC 14 C flag from the self-built VTK, fix five translation units MSVC rejects, and replace `fcsv_to_hdf5`'s POSIX `wordexp`.

<details>
<summary>What each commit changes</summary>

- **VTK flag.** `-Wno-error=implicit-function-declaration` was added (ab9c9585f) so VTK's bundled HDF5 compiled under GCC 14. The VTK modules BRAINSTools now enables no longer build HDF5, and `cl` rejects the flag (D8021), so the VTK ExternalProject failed its compiler check on Windows. The flag is removed. Only the self-built VTK ever got it; a system VTK or Slicer's VTK skips this ExternalProject.
- **MSVC and ITK 6 sources.**
  - `LLSBiasCorrector.hxx`: `std::numeric_limits::infinity()` had no template argument; GCC accepted it only because the template was never instantiated.
  - `M_PI` (not defined by MSVC) becomes `itk::Math::pi` in two GTests.
  - `ImgmathGTest`: a lambda read a `const` local without capturing it; the local is now `static constexpr`.
  - `itkOrthogonalize3DRotationMatrix.cxx`: ITK 6 deprecates `vnl/algo/vnl_svd.h` (a warning under `ITK_LEGACY_REMOVE`, an error under `ITK_FUTURE_LEGACY_REMOVE`) and no longer reaches it through `itkMatrix.h`. With `itkBridgeMathSVD.h` present it uses `itk::bridge::Math::SVD`, keeping singular values above 1e-6 of the largest as `vnl_svd`'s negative `zero_out_tol` did; otherwise the original `vnl_svd` code is unchanged.
- **Glob.** `fcsv_to_hdf5` included `glob.h` and called `wordexp`, neither of which exists on Windows. `itksys::Glob` expands each whitespace-separated pattern; tilde and environment-variable expansion is left to the shell.

</details>

<details>
<summary>Testing</summary>

- Linux (conda GCC), BRAINSTools at 479f147b plus these commits: 462/462 tests pass against ITK main, 459/459 against ITK release-5.4.
- Linux, ITK main, with the flag removed: VTK reconfigured with `CMAKE_C_FLAGS= -fPIC`, its 249 C files rebuilt under GCC 14.3 with no errors, and BRAINSTools rebuilt.
- Windows (MSVC 14.44, Visual Studio 18, Ninja): BRAINSTools builds against ITK main with these commits; it did not before.
- The new SVD path matches the old `vnl_svd` result to within 2.2e-14 (max absolute difference) on 20,000 random, rank-2, near-rank-2 and reflected 3x3 matrices.
- pre-commit passes on this branch.

</details>

<details>
<summary>AI assistance</summary>

Claude Code found the failures on the Windows build, wrote the changes and the SVD comparison program, and ran the Linux and Windows builds and tests.

</details>

<!--
provenance: claude-code session 2026-11-07, Windows sccache forest D:\S-sc (engr-d-coe138-2)
remaining: ~100 other deprecated vnl/algo uses in BRAINSTools (vnl_symmetric_eigensystem, vnl_qr, vnl_matrix_inverse, ...) still warn on ITK 6 and fail under ITK_FUTURE_LEGACY_REMOVE; see itk_forest_build_testbed skill itk-dual-version-compat
-->

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0530f229f9f8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.