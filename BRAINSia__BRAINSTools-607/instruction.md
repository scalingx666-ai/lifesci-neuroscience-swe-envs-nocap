# Issue

**Title:** STYLE: Modernize CMake usage

## Description

Modernize two CMake files to the current preferred style — no functional change.

<details>
<summary>What changed (2 files, 6 lines)</summary>

- `CMakeLists.txt`: `MESSAGE(FATAL_ERROR …)` → `message(FATAL_ERROR …)`.
- `DWIConvert/FindLIBICONV.cmake`: dropped the redundant block-end arguments — `else(LIBICONV_FOUND)` → `else()`, `endif(LIBICONV_FOUND)` → `endif()`.

CMake command names are case-insensitive, and `else()`/`endif()` ignore their arguments, so these are semantic no-ops — purely a readability/style update. BRAINSTools pre-commit hooks pass.

</details>

<!--
provenance: claude-code session 2026-06-19, itk5to6 maintenance toolkit (cmake-lowercase + cmake-blockend-cruft tasks)
base: BRAINSia/BRAINSTools main @ a8bdeae5 ; head: hjmjohnson:cmake-modernization
note: cosmetic only; itk-cmake-targets (${ITK_LIBRARIES}/ITK_USE_FILE) deliberately left out — that is a functional ITKv6 change for a separate PR.
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a8bdeae51403`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.