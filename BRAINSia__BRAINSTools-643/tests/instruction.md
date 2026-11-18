# Issue

**Title:** STYLE: Replace manual new/delete with standard containers and unique_ptr

## Description

Enables `modernize-make-unique` in `.clang-tidy`, then replaces hand-managed `new`/`delete` with `std::vector`, `std::string`, and `std::unique_ptr` in four topic commits. Three of the changes fix real leaks: LLSModel's HDF5 file on exception, the DWIConvert FSL/NRRD converters, and a reader in the Siemens b-matrix test.

<details>
<summary>Commits</summary>

| Commit | Change |
|---|---|
| COMP: Enable modernize-make-unique | The check reports 0 findings on sources and headers; enabling it guards against regressions. |
| STYLE: Replace manually managed scratch arrays | AtlasDefinition XML handler, AverageImageFilter iterators, LLSModel HDF5 buffers (read and write straight from `std::vector`/`vnl_matrix` storage), BFileCompareTool. |
| STYLE: Remove unused muAlloc | No callers; it tested a throwing `new` against `NULL`. |
| STYLE: Own HDF5 and DICOM file members | `LLSModel::m_H5File` and `DCMTKFileReader::m_DFile` become `std::unique_ptr`. `Read()`/`Write()` previously leaked the open file when an exception left the try block. |
| STYLE: Own DWIConvert converters and readers | The factory owns its readers; `New()` and `CreateDicomConverter()` return `std::unique_ptr`; FSL/NRRD paths no longer leak when they throw. |

</details>

<details>
<summary>Remaining cppcoreguidelines-owning-memory findings (20, intentional)</summary>

- 18 `DcmDictEntry` allocations in the GE, Philips, and Siemens converters: the DCMTK dictionary takes ownership.
- 2 in `FFTWUpsample.cpp`: RTK's `OverrideBoundaryCondition` deletes the condition itself.

Not covered, because this build does not compile them: `QHullMSTClusteringProcess.cxx`, the Qt GUI code, `DebugImageViewer`, and ITKMatlabIO.

Known follow-up, out of scope: converters returned by `CreateDicomConverter` keep raw pointers to headers the local factory frees on return. Every current read happens before the return, but fixing it properly means changing `DCMTKFileVector` across the vendor converters.

</details>

<details>
<summary>Testing and AI disclosure</summary>

- Inner Release build on macOS (AppleClang): no new warnings.
- `ctest`: 554/554 passed on the final tree (4 locale cases skipped as before).
- clang-tidy (Homebrew LLVM 23.1.4) `cppcoreguidelines-owning-memory`: 61 findings to 20.

Claude Code (claude-opus-5-5) ran the clang-tidy audit, classified the findings, and drafted the changes. Each ownership change was checked against the library's ownership semantics (DCMTK, RTK, HDF5) before editing, and every commit was built and tested locally.

</details>

<!--
provenance: claude-code session 2026-10-26
follow_up: .devlocal/hints/dwiconvert-dangling-dicom-headers.md
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f9f425774711`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.