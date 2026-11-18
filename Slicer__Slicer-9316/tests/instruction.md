# Issue

**Title:** COMP: Update BRAINSTools to pick up vendored DCMTK reader

## Description

Slicer pins BRAINSTools at `ced799ad` (2025-11-10). That revision predates BRAINSTools vendoring ITK's `itkDCMTKFileReader.h`, which ITK has since made private, so `DWIConvert` does not compile against current ITK main. Advance the pin to current BRAINSTools `main`.

Independent of the ITK v6 transition — this is a stale dependency pin — but it is a prerequisite for it. Tracked in #9149.

<details>
<summary>The failure</summary>

```
DWIConverter.h:46:10: fatal error: 'itkDCMTKFileReader.h' file not found
```

BRAINSTools fixed this upstream by vendoring the reader into DWIConvert. The pinned revision predates that work by nine months.

`768345a75b` additionally carries the tiered `itk::bridge::Math` spelling that ITK main now provides (ITK #6768), keeping BRAINSTools in step with ITK's current numerics API.

</details>

<details>
<summary>Verification</summary>

Built in a downstream forest testbed that builds Slicer plus the ExtensionsIndex against a chosen ITK ref, on macOS arm64. Every ref below was confirmed in the build tree itself, not merely in configuration:

| Component | Ref | Committed (UTC) |
|---|---|---|
| ITK | `fee22c1e22` — `upstream/main` (6.0.0) | 2026-08-22 12:07 |
| ITK as consumed by Slicer | `f05d774ddf` — the above plus the customizable-ITK-namespace patch | 2026-08-22 12:51 |
| BRAINSTools | `768345a75b` — this pin, current `main` | 2026-08-22 17:42 |
| ANTs | `ANTsX/ANTs#2019` head | — |

Slicer core builds with this pin: `SlicerApp-real` plus 46 CLI modules produced, `DWIConvert` among them. Verified by artifact rather than build exit code.

The customizable-ITK-namespace patch is the only ITK change Slicer still needs that is not in ITK main; the `Threads::Threads` export fix it also required merged upstream as ITK #6776.

</details>

<details>
<summary>Change from the previous revision of this PR</summary>

This PR previously pinned `f34f9f753b` (2026-08-21). Advanced to `768345a75b`, current BRAINSTools `main`. The delta is a single commit, `768345a7 "BUG: Remove accidentally committed CTest artifacts"`, which removes stray files and does not alter build behaviour — the pin is moved to keep it at `main` rather than to fix anything.

</details>

<!--
provenance: itk_forest_build_testbed, 2026-08-22, macOS arm64
supersedes_pin: ced799ad (2025-11-10) -> 768345a75b (2026-08-22)
pr_revisions: aca0edc1 (2026-07-23) -> 1b277c88a2 (f34f9f753b) -> b22c149012 (768345a75b)
verified_against_itk: fee22c1e22 (6.0.0 upstream/main); Slicer consumes f05d774ddf (= that + namespace patch)
brainstools_delta: f34f9f753b..768345a75b = 1 commit, CTest artifact removal only
artifacts_verified: SlicerApp-real + 46 cli-modules incl. DWIConvert, 2026-08-22 12:46 CDT
tracker: Slicer/Slicer#9149
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `583e9b37d50e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.