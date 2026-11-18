# Issue

**Title:** COMP: Vendor itkDCMTKFileReader into PETStandardUptakeValueComputation

## Description

`PETStandardUptakeValueComputation` fails to build against ITK `main` because ITK made `itkDCMTKFileReader.h` a **private, non-installed** header of the `ITKIODCMTK` module in  (commit `db492d9b092a6ca585ab6b12e896ca63229ad8e8`). Downstream `#include "itkDCMTKFileReader.h"` no longer resolves.

This vendors the reader (`.h` + `.cxx`) directly into the CLI, pinned to that ITK commit, and compiles the `.cxx` via `ADDITIONAL_SRCS` — the same pattern already used by SlicerExt PETDICOMExtension/`SUVFactorCalculatorCLI`. The upstream migration is documented in .

<details>
<summary>Backward compatibility (ITKv5 and ITKv6.0b01, before privatization)</summary>

Verified compatible with ITK versions that still installed the header publicly:

- **Header shadowing:** `#include "itkDCMTKFileReader.h"` (quote form) resolves the local vendored copy first, so it cleanly shadows any ITK-installed header.
- **Export macro:** the vendored header self-defines `ITKIODCMTK_EXPORT` as empty under `#ifndef`, inert whether or not the ITK-installed `ITKIODCMTKExport.h` is present.
- **No duplicate symbols:** the vendored `.cxx` object satisfies the CLI's `itk::DCMTKFileReader` references before the linker consults `libITKIODCMTK`, so co-linking the module (still in `ITK_COMPONENTS`) does not produce duplicate-symbol errors. This is exactly how `SUVFactorCalculatorCLI` has built against public-header ITK (v5, v6.0b01) for years.
- **Includes:** only version-stable ITK public headers (`itkMacro.h`, `itkByteSwapper.h`, `itkImageIOBase.h`, …) and DCMTK — no post-privatization dependency.

</details>

<!--
provenance: claude-code session 2026-07-05
itk_cause_pr: InsightSoftwareConsortium/ITK#6496 (db492d9b092a6ca585ab6b12e896ca63229ad8e8)
itk_migration_doc_pr: InsightSoftwareConsortium/ITK#6553
precedent: SlicerExt SUVFactorCalculatorCLI (identical vendoring)
forest_validation: svdc forest Slicer build compiled+linked PET past prior breakage
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `28ef15df2165`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.