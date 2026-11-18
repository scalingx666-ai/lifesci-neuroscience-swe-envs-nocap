# Issue

**Title:** STYLE: Use const iterators for read-only loops in BRAINSCommonLib tests

## Description

Uses `ImageRegionConstIteratorWithIndex` for the 13 read-only pixel-comparison
iterators in `itkIOGTest.cxx` and `ImgmathGTest.cxx`. Follows #686, which does
the same in library code; the two PRs touch different files and are
independent.

<details>
<summary>BRAINSSuperResolution iterators: none converted</summary>

The three remaining candidates stay as they are:

- `FFTWUpsample.cpp` `MoveFFTCoeffs`: the iterator is passed to
  `ReshapeConvertIndex2`, which takes a non-const iterator reference.
- `FFTWUpsample.cpp` `ReshapeFFT` and `SimpleOpWeightedL2.cpp`: the iterator is
  declared and never used. Removing a dead variable is a different cleanup.

</details>

<details>
<summary>Local verification</summary>

- macOS, Release, ITK 5.4.7 SuperBuild with `USE_BRAINSSuperResolution=ON`:
  full build is clean and the 26 `itkIO` and `Imgmath` tests pass.
- `pre-commit run --all-files` exits 0.
- Not run: the full test suite (only test code changed), ITK main, Linux, and
  CI.

</details>

<!--
provenance: claude-code session 2026-11-01
scanner: itk_forest_build_testbed/skills/itk-prefer-const-read-only-iterators/const_iterators.py
related: BRAINSTools #686; hj-todos item left-unconverted-13-test-file-iterators-and-3-brainssuperres
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f457d85b9d87`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.