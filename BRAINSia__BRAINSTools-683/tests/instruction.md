# Issue

**Title:** BUG: Order DWI slices into volumes independently of ITK's file order

## Description

DWIConvert now groups DICOM slices into volumes itself, following dcm2niix, so the result no longer depends on the file order ITK returns. This fixes the 14 DWIConvert failures against ITK main with InsightSoftwareConsortium/ITK#7056, and keeps working with InsightSoftwareConsortium/ITK#7064, which makes `DCMTKSeriesFileNames` throw on repeated slice positions.

<details>
<summary>Root cause</summary>

DWIConvert read each volume's gradient by stride from the file list, and the vendor converters disagreed about that list's order: GE and Siemens assumed volume-major order, and Philips assumed position-major order. ITK 5.4 `DCMTKSeriesFileNames` sorted by InstanceNumber, which happened to suit all three on the test data. ITK main sorts by slice position, which reversed the GE pairing (gradient 1 became 0.627, 0.110, 0.771 instead of b0). ITK main also applies `UseSeriesDetails`, which split each Siemens series by Sequence Name and returned 1 file of 31.

The DICOM standard gives classic single-frame MR images no attribute that identifies the volume (PS3.3 C.7.6.1; the diffusion macro and Dimension Index apply only to enhanced multi-frame objects), so any converter relies on a heuristic.

</details>

<details>
<summary>Changes</summary>

- `OrderSlicesVolumeMajor()`: groups slices by position along the slice normal, ranks the repeats at each position by InstanceNumber to get the volume index, and throws when positions repeat unevenly. Slices within a volume keep acquisition order unless it is not monotonic in space. This gives dcm2niix's result for both volume-major (GE, Siemens) and position-major (Philips) numbering in the test data.
- The de-interleave heuristic for single-frame series is removed; every vendor converter now sees volume-major headers. Philips reads each volume's first slice instead of the first `NVolume` headers.
- GE and Philips check that every slice of a volume carries the volume's b-value and gradient, and throw if not. None of the converters surveyed (dcm2niix, dicm2nii, MRtrix3) makes this check.
- `UseSeriesDetails` stays on; detail groups that share the first Series Instance UID are merged.
- `SetFailOnAmbiguousOrdering(false)` is called when ITK provides it (through an overload that compiles only if the method exists), so builds against ITK 5.4 and current main are unaffected.
- `DWIConvertSiemensSmallGradientRejectedTest` matches the error text without the `ITK ERROR:` prefix that ITK main no longer emits.

</details>

<details>
<summary>Local testing</summary>

Linux, GCC 13.3, Release SuperBuilds. `ctest -R DWIConvert`, 52 tests:

| ITK | Result |
|---|---|
| v5.4.7 | 52/52 pass |
| main `ffda1aac7d` + ITK#7056 | 52/52 pass |
| same + ITK#7064 (throws on repeated positions) | 52/52 pass |

`pre-commit run --all-files` passes.

</details>

<details>
<summary>AI assistance</summary>

Claude Code traced the regression to `DCMTKSeriesFileNames`, surveyed dcm2niix, dicm2nii, MRtrix3, GDCM, and the DICOM standard, wrote the changes, and ran the builds above. I directed the approach (dcm2niix as the reference, series details on) and reviewed the change.

</details>

<!--
provenance: claude-code session 2026-11-01
commits: ff7c72928 (test regex), 0a2d30422 (ordering + per-volume validation), b356a3573 (FailOnAmbiguousOrdering opt-out)
research: .devlocal/research/dwi-dicom-volume-ordering.md (local only)
related: ITK#7056 (transform inverse fix), ITK#7064 (DCMTK throw, GDCM sticky flag)
-->

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `281fbf79dbbc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.