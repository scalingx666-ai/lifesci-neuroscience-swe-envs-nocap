# Issue

**Title:** BUG: Let DWIConvert converters own their DICOM file readers

## Description

Let the DWIConvert vendor converters own their DICOM file readers instead of holding raw pointers into a factory that is destroyed before the converter is used.

<details>
<summary>Root cause and change</summary>

`DWIConvert::CreateDicomConverter` builds a `DWIConverterFactory` as a local. Since 2a150026 the factory owned the `brains::DCMTKFileReader` objects in a `unique_ptr` vector and handed each converter a parallel `std::vector<DCMTKFileReader *>`. When the function returned, the readers were freed while the converter kept `m_Headers` full of dangling pointers. No current method reads `m_Headers` after construction (every read is inside `LoadDicomDirectory` or `ExtractDWIData`, both called before the return), so this was latent rather than live.

`DCMTKFileVector` is now `std::vector<std::unique_ptr<brains::DCMTKFileReader>>`. The factory moves it into the vendor converter it creates; the vendor constructors take it by value and move it to `DWIDICOMConverterBase`; the factory's duplicate owning vector is removed. One raw-pointer local in `PhilipsDWIConverter` uses `.get()`, and `SiemensBMatrixGTest` moves its reader into the vector.

</details>

<details>
<summary>Testing and AI disclosure</summary>

macOS inner Release build (AppleClang): no errors, no new warnings. `ctest -R 'DWI|DCMTK|Siemens|BMatrix'`: 83/83. Full `ctest`: 554/554 (4 locale cases skipped, as on `main`). `pre-commit run --all-files` passes.

Claude Code (claude-fable-5-1) made the edits from the audit recorded when 2a150026 landed; the author reviewed every hunk.

</details>

<!--
provenance: claude-code session 2026-10-28
hint: .devlocal/hints/dwiconvert-dangling-dicom-headers.md
post_merge_action: remove the todo Recent note for branch fix-dwiconvert-header-ownership
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bbda558f29c7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.