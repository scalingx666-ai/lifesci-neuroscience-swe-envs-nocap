# Issue

**Title:** COMP: Move vendored DCMTK reader into the brains namespace

## Description

Moves the vendored DCMTK reader out of `namespace itk` so it cannot collide with the copy ITK 5.4 still exports from `ITKIODCMTK`. Without this, Slicer's Windows build fails to link `DWIConvert` with `LNK2005` — see .

Files renamed to `brainsDCMTKFileReader.{h,cxx}`; classes are now `brains::DCMTKFileReader`, `brains::DCMTKItem`, `brains::DCMTKSequence`.

**Blocks** , which pins the commit that introduces the collision and cannot merge until this lands.

<details>
<summary>Root cause</summary>

ITK commit  — *"ENH: Make ITKDCMTK a private dependency of ITKIODCMTK"* — moved the header:

```
ITK v5.4 : Modules/IO/DCMTK/include/itkDCMTKFileReader.h   <- public, symbols exported
ITK main : Modules/IO/DCMTK/src/itkDCMTKFileReader.h       <- private
```

767ba471 vendored a copy so DWIConvert would keep building, but left the classes in `namespace itk`. That is correct against ITKv6 and not backward compatible:

| Consumer's ITK | ITK exports the symbols? | Result |
|---|---|---|
| ITKv6 / `main` | no (private) | vendored copy is the only definition — fine |
| 5.4.7 | yes | two definitions of the same mangled symbols |

ELF and Mach-O resolve the duplicate silently in favour of the object file, so only MSVC diagnoses it — but the ODR violation is present on every platform and either definition may win. If the vendored copy ever drifts from ITK's, that becomes a silent wrong-behaviour bug rather than a link error.

A second factor: the `#ifndef ITKIODCMTK_EXPORT / #define ITKIODCMTK_EXPORT` shim stripped `__declspec(dllimport)`, which is what promoted a redeclaration into a duplicate *definition* on MSVC. That shim is removed here — the reader builds into the static `DWIConvertSupportLib` and needs no export attributes.

</details>

<details>
<summary>Verification</summary>

Compiled the vendored translation unit using ITK's own compile flags (taken from `compile_commands.json` of an ITK 5.4 Slicer build tree, substituting only the source file), then compared defined symbols against that tree's `libITKIODCMTK-5.4.1.dylib`:

| Version | Exact mangled-symbol collisions with `ITKIODCMTK-5.4` |
|---|---|
| `main` (767ba471 as-is) | **56** |
| this branch | **0** |

Sample of the 56, demangled — the same names in the Slicer Windows log:

```
slicer_itk::DCMTKSequence::SetDcmSequenceOfItems(DcmSequenceOfItems*)
slicer_itk::DCMTKFileReader::CanReadFile(std::string const&)
slicer_itk::DCMTKFileReader::IsImageFile(std::string const&)
slicer_itk::DCMTKFileReader::SetFileName(std::string const&)
```

Also compiles warning-free against ITK 5.4 with ITK's public `itkDCMTKFileReader.h` on the include path (the two headers coexist without ambiguity), and against ITK `main` where the header is private.

**Not verified:** a full DWIConvert build or a Windows link — no BRAINSTools build tree was available. The nine consumer files were changed by qualified-name substitution and reviewed by inspection, not compiled. Windows confirmation requested from @dzenanz on the Slicer PR.

</details>

<details>
<summary>What changed</summary>

- `DWIConvert/itkDCMTKFileReader.{h,cxx}` → `brainsDCMTKFileReader.{h,cxx}` (renames, 93% / 99% similarity)
- `namespace itk` → `namespace brains` for `DCMTKItem`, `DCMTKSequence`, `DCMTKFileReader`, `CompareDCMTKFileReaders`
- Removed the `ITKIODCMTK_EXPORT` no-op shim and the `ITKIODCMTK_EXPORT` / `ITK_FORWARD_EXPORT` class attributes
- Added `#include "itkMetaDataObject.h"` — `EncapsulateMetaData` was only resolving transitively
- Guarded the `DCMTKExceptionOrErrorReturn` macro with `#ifndef`
- Nine consumers updated to `brains::`; `itk::DCMTKImageIO` and `itk::DCMTKSeriesFileNames` are genuine ITK classes and are untouched

Bodies stay textually identical to ITK's: `using` declarations at the top of `namespace brains` supply the `itk` names the vendored code references unqualified, so future re-syncs with upstream ITK remain diffable.

</details>

<!--
provenance: claude-code session 2026-08-13 (hjmjohnson)
itk_commit: db492d9b092 moved Modules/IO/DCMTK/include/itkDCMTKFileReader.h -> src/ (PRIVATE)
prior: BRAINSTools 767ba471 vendored the reader but kept namespace itk
evidence: 56 -> 0 exact mangled-symbol collisions vs libITKIODCMTK-5.4.1.dylib
verified_with: ~/src/itk_forest_build_testbed/build_forest-itk-release-5.4/Slicer/build/ITK-build
unverified: full DWIConvert build; Windows link (requested from dzenanz on Slicer#9316)
post_merge_action: re-pin Slicer#9316 past this commit, then correct that PR's description
  (it claims the old pin fails with 'itkDCMTKFileReader.h' file not found, impossible on ITK 5.4.7)
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aca0edc1e3ed`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.