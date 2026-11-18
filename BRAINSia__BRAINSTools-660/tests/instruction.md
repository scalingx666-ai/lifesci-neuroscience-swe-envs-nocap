# Issue

**Title:** BUG: Write unsigned 16-bit DWI data as unsigned short

## Description

DWIConvert now writes unsigned 16-bit DICOM data (all the Philips and Siemens test series) as `unsigned short` instead of labeling it `short`, so voxels above 32767 no longer read back negative. Follows up the warning-only handling of #457.

<details>
<summary>What changes</summary>

Nothing between the read and the write computes a pixel value, so the `short` volume already carries the unsigned bits unchanged; only the label was wrong. The output type is chosen at run time:

- DICOM: unsigned when PixelRepresentation is 0 and the rescale intercept is not negative.
- NRRD and NIfTI input: an unsigned 16-bit file is accepted without `--allowLossyConversion` and stays unsigned, so DicomToNrrd -> NrrdToFSL -> FSLToNrrd round trips keep the type.
- The NRRD header says `unsigned short`; NIfTI is written as UINT16.
- `DWIConvert/README.md` describes the new behavior in place of the old warning note.

Storage stays `short`; the unsigned flag is applied only at the read and write sites (`DWIConvertUtils`, `DWIConverter`).

</details>

<details>
<summary>Testing</summary>

Local macOS build, ctest: 556 tests, 555 passed on the first run. The one failure, `BCDTest_writeBranded2DImage`, timed out in the parallel run (900 s limit) and passed alone in 842 s, so all 556 pass.

The existing baseline comparisons cast both images to the baseline's type and cannot see the label, so two new tests (`DicomToNrrdPixelTypeTest.cmake`) convert an unsigned (Siemens) and a signed (GE) series and check the NRRD `type:` field before and after the FSL round trip. All 16 Philips and Siemens test series now write `unsigned short`.

`pre-commit run --all-files` passes on the pushed tip.

</details>

<details>
<summary>AI disclosure</summary>

Claude Code analyzed the pixel-type flow, wrote the change and the new tests, and ran the builds and test runs. The author reviewed the diff.

</details>

<!--
provenance: claude-code session 2026-10-30
related_files: DWIConvert/DWIConvertUtils.h(xx), DWIConvert/DWIConverter.{h,cxx}, DWIConvert/TestSuite/DicomToNrrdPixelTypeTest.cmake
related_issue: BRAINSia/BRAINSTools#457 (already closed; refs only)
post_merge_action: remove the DWIConvert pixel-type item from .devlocal/todo.md
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `24fc0f13b602`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.