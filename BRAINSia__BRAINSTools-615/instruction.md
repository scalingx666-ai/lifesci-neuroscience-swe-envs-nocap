# Issue

**Title:** COMP: Vendor ITK's now-private DCMTK reader into DWIConvert

## Description

Fixes a build break against current ITK: `DWIConvert` fails to compile because `itkDCMTKFileReader.h` can no longer be found.

ITK commit `db492d9b09` ("Make ITKDCMTK a private dependency of ITKIODCMTK") moved `itkDCMTKFileReader.h` from `include/` to `src/` so raw DCMTK types no longer appear in ITK's public headers — the header is no longer installed. DWIConvert uses `itk::DCMTKFileReader` (and `DCMTKSequence`/`DCMTKItem`) extensively across its DICOM converters.

Vendor the declaration into DWIConvert under the deliberately distinct name `DWIConvertVendoredDCMTKFileReader.h` (so it is obvious the header is DWIConvert-owned, not an ITK-installed header) and update the includes. The class stays `itk::DCMTKFileReader` and the reader's symbols are still exported by `libITKIODCMTK`, so DWIConvert keeps linking `ITKIODCMTK` for the definitions with no ODR clash. The header resolves for both a standard ITK build and Slicer's custom-namespace ITK build.

<details>
<summary>Validation & context</summary>

Surfaced by building 3D Slicer (which bundles DWIConvert) against current ITK `main` in an ITK downstream-consumer forest. With this change, `libDWIConvertSupportLib` and DWIConvert compile and link against current ITK. If ITK later stops exporting the reader's symbols from `libITKIODCMTK`, DWIConvert must own the implementation (vendor the `.cxx` under a private namespace) — noted in the vendored header.

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3cdef2efcee5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.