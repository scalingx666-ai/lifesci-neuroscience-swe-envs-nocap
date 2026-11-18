# Issue

**Title:** ENH: Add a BRAINSABC smoke test that runs in seconds

## Description

Adds `BRAINSABCSmokeTest`, a BRAINSABC run on inputs shrunk by 2 that takes
10 to 17 s wall and 87 CPU-s, against 86 s and 650 CPU-s for
`BRAINSABCSmallTest`. Output labels are checked against the shipped
`BRAINSABCSmallLabels.nii.gz` baseline.

The test is registered only where BRAINSABC is built. CI sets
`USE_AutoWorkup=OFF` and `USE_ReferenceAtlas=OFF`, so it does not run in CI
until a follow-up enables them.

<details>
<summary>What the tests do</summary>

- `BRAINSABCSmokeShrinkT1Test` and `BRAINSABCSmokeShrinkT2Test` shrink the
  256^3 inputs to 128^3 with `itk::BinShrinkImageFilter`.
- `BRAINSABCSmokeTest` runs the same BRAINSABC arguments as the small test.
- `BRAINSABCSmokeLabelsTest` checks the output size equals baseline / 2, that
  no label is absent from the baseline, and that each label with an expected
  count of at least 100 voxels has a count within 0.5x to 2x of baseline / 8.
- Fixtures order the four tests, so selecting `BRAINSABCSmokeTest` by name
  runs its setup.

</details>

<details>
<summary>Local verification</summary>

- macOS, Release build: the four tests pass in 9.7 to 16.7 s.
- The output has the same 11 labels as the baseline, with count ratios of
  0.91 to 1.17.
- The checker rejects a wrong-sized image, a missing label, merged labels, an
  unexpected label, a tolerance of 1.01, and bad usage.
- Shrinking by 4 fails inside BRAINSABC ("Infinite loop detected for
  auto-correction"): the smallest label has 89 samples against a minimum of
  100. Shrink 2 is the limit.
- Not run: Linux/GCC, and CI.

</details>

<details>
<summary>Related findings, not changed here</summary>

- `BRAINSABCSmallTest` is in the generated `CTEST_CUSTOM_TESTS_IGNORE`, which
  `ctest -N` and `-R` honor, so it cannot be selected.
- The comment in `CMake/CTestCustom.cmake.in` claiming `-R` is unaffected is
  wrong.

</details>

<!--
provenance: claude-code session 2026-11-01
related_files: BRAINSABC/TestSuite/CMakeLists.txt,
  BRAINSABC/TestSuite/BRAINSABCSmokeTestHelper.cxx
post_merge_action: separate PR to enable USE_AutoWorkup and USE_ReferenceAtlas
  in CI and add the atlas data to the test-data cache
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1dd8452bc0f0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.