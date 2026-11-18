# Issue

**Title:** ENH: Add USE_SYSTEM_ANTs to build against a prebuilt ANTs

## Description

Add a `USE_SYSTEM_ANTs` option so BRAINSTools can build against a pre-built ANTs (via `find_package(ANTS CONFIG)`) instead of cloning and building its own, mirroring the existing `USE_SYSTEM_ITK` / `USE_SYSTEM_VTK` pattern.

<details>
<summary>What changed</summary>

`SuperBuild/External_ANTs.cmake` previously always built ANTs. It now, when `USE_SYSTEM_ANTs` is ON **or** an `ANTS_DIR` is supplied:
- runs `find_package(ANTS CONFIG REQUIRED)` (when `USE_SYSTEM_ANTs`),
- validates `ANTS_DIR`,
- adds a no-op `ExternalProject_Add_Empty(ANTs DEPENDS …)` so dependents still resolve (same mechanism `External_ITKv5.cmake` uses),
- exposes `ANTS_DIR` to the inner build (which already calls `find_package(ANTS CONFIG REQUIRED)`),
- and skips building ANTs.

`SuperBuild.cmake` gains the `option(USE_SYSTEM_ANTs …)` next to `USE_SYSTEM_ITK`.

The default path is unchanged: with neither flag set, ANTs is built from the configured `GIT_REPOSITORY`/`GIT_TAG`.

Usage:
```bash
cmake … -DUSE_SYSTEM_ANTs:BOOL=ON -DANTS_DIR:PATH=/path/to/lib/cmake/ANTS
# or simply pass a prebuilt -DANTS_DIR:PATH=… (skip-build is driven by ANTS_DIR, like ITK_DIR)
```
</details>

<details>
<summary>Local validation</summary>

Configured the SuperBuild both ways (CMake 4.3, Ninja):
- `USE_SYSTEM_ANTs=ON` + `ANTS_DIR=<prebuilt>`: configure succeeds; the ANTs EP performs **no** download/configure/build step (no-op empty target); dependents resolve; inner `find_package(ANTS)` consumes `ANTS_DIR`.
- No flags: configure succeeds; the real ANTs EP is scheduled cloning `ANTsX/ANTs`. Default behavior preserved.

`pre-commit run` clean on the changed files.
</details>

<!--
provenance: claude-code session 2026-06-18, itk_forest_build_testbed
base: BRAINSia/BRAINSTools@4349fc15 (main)
files: SuperBuild.cmake, SuperBuild/External_ANTs.cmake (+21 lines)
mechanism: mirrors External_ITKv5 USE_SYSTEM + ExternalProject_Add_Empty placeholder
motivation: forest testbed builds ANTs once (standalone) and reuses it for BRAINSTools
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4349fc15483d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.