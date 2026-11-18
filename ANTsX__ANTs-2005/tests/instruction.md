# Issue

**Title:** ENH: Allow building against ITK v5 or v6 (default v6)

## Description

Restores the ability to configure ANTs against ITK **v5** (`release-5.4`) while keeping **v6 as the default**, via `cmake -DITK_VERSION_MAJOR=5`. Being able to compile the *same* ANTs source against both ITK majors is an important transition step: it is what lets us validate results and quantify the algorithmic differences between ITK v5 and v6 that can make tests produce slightly different numbers. Without it, an ITK-induced change in output is indistinguishable from an ANTs change.

Verified locally against ITK v5.4.6: **494/494 targets, 0 errors**, and the **full test suite passes 171/171** (`RUN_SHORT_TESTS` and `RUN_LONG_TESTS` both ON). The ITK v6 default path is unchanged.

<details>
<summary>Why: commit 0c1d30c5 ("WIP: Update to ITK6") may have been merged in error</summary>

`0c1d30c5` is labelled **WIP** in its own subject line, which suggests it was not intended to land as-is. It hard-wired `ITK_VERSION_MAJOR` to `6` (`set_property(CACHE ITK_VERSION_MAJOR PROPERTY STRINGS "6")`) and renamed `SuperBuild/External_ITKv5.cmake` → `External_ITKv6.cmake`, removing any way to build against ITK v5.

That turns out to have been unnecessarily lossy: **ANTs on ITK 5.4.6 is not merely compilable, it is test-clean** (171/171). The ITK6-only part of that commit was the CMake plumbing, not the C++. So dropping v5 support cost us the cross-major comparison capability without any corresponding source-level requirement.

This PR does not revert `0c1d30c5` — the move to ITK v6 as the default is correct and is preserved. It only makes v5 selectable again.

</details>

<details>
<summary>What changed</summary>

- **`Common.cmake`** — `ITK_VERSION_MAJOR` is a validated `6`-or-`5` choice (default `6`); sets `USE_ITKv5`/`USE_ITKv6` accordingly and records the requested major before `find_package(ITK)` overwrites the variable. Also drops a dead self-comparison block (`expected_ITK_VERSION_MAJOR` was assigned from `ITK_VERSION_MAJOR` and then compared against it, so the guard could never fire).
- **`SuperBuild/External_ITKv5.cmake`** — restored, pinned to ITK **v5.4.6** (`f7ff6ad5`, the newest tag on `release-5.4`).
- **`SuperBuild/External_SlicerExecutionModel.cmake`** — depends on `ITKv${ITK_VERSION_MAJOR}` rather than the literal `ITKv6`.
- **`SuperBuild.cmake`** — `USE_TractographyTRX` becomes a `CMAKE_DEPENDENT_OPTION` gated on `ITK_VERSION_MAJOR EQUAL 6`, so it is only selectable when ITK v6 is chosen and is forced OFF (hidden from the cache) otherwise.
- **`ANTS.cmake`** — configure-time `FATAL_ERROR` if the ITK actually found does not match the requested major (a silent mismatch would otherwise surface as confusing compile errors), and a `FATAL_ERROR` if `USE_TractographyTRX` is requested with ITK v5.
- **`CTestCustom.cmake`** — warning/error exception lists carry both `ITKv5` and `ITKv6`.

</details>

<details>
<summary>Why TractographyTRX is gated on ITK v6 (it is a CMake coupling, not an API requirement)</summary>

To be precise, TRX does **not** require ITK v6 at the API level. Its `CMakeLists.txt` asks only for `find_package(ITK REQUIRED)` with no version floor, and its `itk-module.cmake` depends on `ITKCommon`, `ITKTransform`, `ITKEigen3`, `ITKIONIFTI`, `ITKMathematicalMorphology` — all present in 5.4. Two CMake-level couplings block it anyway:

1. **No remote-module entry.** ITK 5.4 ships no `Modules/Remote/TractographyTRX.remote.cmake` (added to ITK `main` in `43f49d75`). ANTs' SuperBuild enables TRX by passing `-DModule_TractographyTRX:BOOL=ON` to ITK, which is simply a no-op on `release-5.4`.

2. **A hardcoded ITK v6 zlib export name.** Building TRX standalone against an ITK 5.4.6 tree fails at CMake *generate*, before compiling anything: `Target "zip" links to: ITK::ITKZLIBModule but the target was not found.` TRX's `itk-module-init.cmake` bridges ITK's internal zlib to `ZLIB::ZLIB` for its vendored libzip and assumes the target is named `ITKZLIBModule` / `ITK::ITKZLIBModule`. ITK v6 exports that name; **ITK 5.4 exports only `itkzlib`.**

Item 2 looks like a small fix, but it belongs upstream in [ITKTractographyTRX](https://github.com/tee-ar-ex/ITKTractographyTRX), not in ANTs. Until both are addressed, TRX cannot be enabled through ANTs on ITK v5, so gating the option is the honest behavior. An ITK v5 build therefore does not build `antsApplyTransformsToTRX` or `PrintTRXHeader`, and `USE_TractographyTRX` is hidden from the cache rather than silently ignored.

</details>

<details>
<summary>Local validation</summary>

| Configuration | Result |
|---|---|
| Inner build, `ITK_VERSION_MAJOR=5`, real ITK 5.4.6 | **494/494 targets, 0 errors; ctest 171/171 passed, 0 failed** |
| Inner build, default (v6), real ITK 6 | **494/494 targets, 0 errors; ctest 171/171 passed, 0 failed** |
| SuperBuild, `ITK_VERSION_MAJOR=5` | configures; resolves `ITKv5`; TRX hidden from cache |
| SuperBuild, `ITK_VERSION_MAJOR=6` | configures; resolves `ITKv6`; `USE_TractographyTRX:BOOL=ON` |
| Default (v6) pointed at an ITK 5 tree | fails at configure: *"ANTs is configured for ITK v6 … but found ITK 5.4.6"* |
| `ITK_VERSION_MAJOR=5` + `USE_TractographyTRX=ON` | fails at configure: *"USE_TractographyTRX needs the ITK v6 TractographyTRX remote module"* |

Both runs cover the full suite with `RUN_SHORT_TESTS=ON` and `RUN_LONG_TESTS=ON` (131 short + 40 long, including the `antsRegistrationTest_*`, `ANTS_ROT_*` and `ANTS_SYN_WITH_TIME` registrations). Both majors register the same 171 tests and both pass all of them, so at current tolerances the suite shows no ITK v5 → v6 behavioral difference.

Not covered: the ITK v5 **SuperBuild** path was configure-tested only — the full clone-and-build of `External_ITKv5.cmake` was not run end to end.

</details>

<!--
provenance: claude-code session 2026-07-14, forest build_forest-ITK-main, repo ANTsX/ANTs
branch: hjmjohnson:allow-itk5-or-itk6, base ANTsX/ANTs main @ 3f95bdce
itkv5_pin: f7ff6ad56d487d9f52e6ba1dbbd9a816a14b5158 (v5.4.6, 2026-04-20)
key_files: Common.cmake, ANTS.cmake, SuperBuild.cmake, SuperBuild/External_ITKv5.cmake,
           SuperBuild/External_SlicerExecutionModel.cmake, CTestCustom.cmake
itk5_evidence: 494/494 ninja targets 0 errors; ctest 171/171 pass (short+long) vs ITK 5.4.6
trx_real_blockers: (1) no Modules/Remote/TractographyTRX.remote.cmake on ITK release-5.4
                   (2) TRX itk-module-init.cmake hardcodes ITK::ITKZLIBModule; ITK 5.4 exports itkzlib
                   -> fix (2) upstream in tee-ar-ex/ITKTractographyTRX, not in ANTs
untested: full ITK v5 SuperBuild (External_ITKv5.cmake clone+build); configure-only there
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `60c87d3d0f8a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.