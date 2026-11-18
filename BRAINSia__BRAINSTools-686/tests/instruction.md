# Issue

**Title:** STYLE: Use const iterators for read-only loops

## Description

Uses `ImageRegionConstIterator` and `ImageRegionConstIteratorWithIndex` where
a loop only reads the image, in 14 files across five commits (one per
subsystem). The `Const` names compile unchanged on ITK 5.4, 5.4.8, and main.

<details>
<summary>Why and what changed</summary>

- A read-only loop now says so, and the compiler rejects an accidental write.
- Where one type alias served a read iterator and a written one, the read side
  gets its own `Const` alias.
- Only iterators whose every use in the function is `Get()`, `Value()`,
  `GetIndex()`, `IsAtEnd()`, `GoToBegin()`, `Begin()`, or `++` were converted.
  Candidates came from a scanner, then each variable's uses were read by hand.
- Commits: BRAINSCommonLib, BRAINSABC, DWIConvert, ConstellationDetector, and
  GTRACT with BRAINSInitializedControlPoints and BRAINSResample.

</details>

<details>
<summary>Local verification</summary>

- macOS, Release, ITK 5.4.7 SuperBuild: clean build, 559 of 559 tests pass.
- `pre-commit run --all-files` exits 0.
- Not run: ITK main, Linux, and CI.

</details>

<details>
<summary>Left unconverted</summary>

- The 12 iterators in `BRAINSCommonLib/TestSuite/itkIOGTest.cxx` and the one
  in `ImgmathGTest.cxx`. They are read-only but live in test code.
- Three BRAINSSuperResolution iterators in `FFTWUpsample.cpp` and
  `SimpleOpWeightedL2.cpp`: they are output iterators, and two are passed to
  functions that may write through them.

</details>

<!--
provenance: claude-code session 2026-11-01
scanner: itk_forest_build_testbed/skills/itk-prefer-const-read-only-iterators/const_iterators.py
related: ITK PR 7065 (const-correct iterators), ITK issue 7003
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f457d85b9d87`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.