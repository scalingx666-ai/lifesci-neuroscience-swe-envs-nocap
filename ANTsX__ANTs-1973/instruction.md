# Issue

**Title:** ENH: Provide ANTSConfig.cmake for find_package(ANTS) (supersedes #1656, closes #1369)

## Description

Supersedes #1656 (WIP since 2024-01 by @dzenanz). . Adds a modern CMake package-config layer so downstream projects can use `find_package(ANTS CONFIG REQUIRED)` and link against `ANTS::antsUtilities` (plus every other exported target) without manually listing include paths or library names.

Verified end-to-end with a fresh install + an independent downstream consumer repo — the package config is functional, not aspirational. **Reviewers and downstream maintainers can reproduce the verification themselves:**

> 📦 **Independent verification repo:** [hjmjohnson/ANTsDependantCMakeSmokeTest](https://github.com/hjmjohnson/ANTsDependantCMakeSmokeTest)
>
> ```bash
> git clone git@github.com:hjmjohnson/ANTsDependantCMakeSmokeTest.git
> cd ANTsDependantCMakeSmokeTest
> ./run.sh <prefix-where-this-PR-was-installed>
> ```
>
> The smoke-test `CMakeLists.txt` is intentionally strict — it `FATAL_ERROR`s if `ANTS::antsUtilities` is missing — and the `main.cxx` exercises the exact ANTs API surface that BRAINSTools currently consumes (`antsUtilities.h`, `itkantsRegistrationHelper.h`, plus headers from `Utilities/` and `ImageRegistration/`), forces a real link-time symbol resolution (`ConvertToLowerCase` from `libantsUtilities`), and instantiates `itk::ANTSAffine3DTransform<double>`. So a green run actually proves the export, header-install, and link-interface machinery all work end-to-end — not just that the `*Config.cmake` files happen to exist.

<details>
<summary>What lands at <code>&lt;prefix&gt;/</code></summary>

```
lib/cmake/ANTS/
  ANTSConfig.cmake            # configure_package_config_file template, re-finds ITK (+VTK)
  ANTSConfigVersion.cmake     # SameMajorVersion compatibility
  ANTSTargets.cmake           # exported targets in the ANTS:: namespace
  ANTSTargets-release.cmake   # per-config (Release / Debug / etc.)

include/ANTs/
  ANTsVersionConfig.h         # generated, defines ANTS_VERSION
  Examples/                   # antsUtilities.h, itkantsRegistrationHelper.h, ...
  Utilities/                  # ReadWriteData.h, antsCommandLineParser.h, ...
  ImageRegistration/          # itkANTSAffine3DTransform.h, ...
  ImageSegmentation/
  Tensor/
  Temporary/

lib/libantsUtilities.{a,so,dylib}
lib/libl_<APP>.{a,so,dylib}   # one per ANTs CLI app
bin/<APP>                     # executables (unchanged)
```

Consumer pattern:

```cmake
find_package(ANTS CONFIG REQUIRED)
add_executable(my_tool main.cxx)
target_link_libraries(my_tool PRIVATE ANTS::antsUtilities)
# Done. ITK include dirs, ANTs include dirs, and link libs all flow
# through ANTS::antsUtilities's INTERFACE_INCLUDE_DIRECTORIES /
# INTERFACE_LINK_LIBRARIES transitively.
```

</details>

<details>
<summary>BRAINSTools migration story (concrete payoff)</summary>

Today, [BRAINSTools/BRAINSTools.cmake](https://github.com/BRAINSia/BRAINSTools/blob/master/BRAINSTools.cmake#L85-L104) detects ANTs the hard way:

```cmake
if(USE_ANTS)
  if(NOT (EXISTS "${ANTs_SOURCE_DIR}" AND IS_DIRECTORY "${ANTs_SOURCE_DIR}"))
    message(FATAL_ERROR "ANTs_SOURCE_DIR: '${ANTs_SOURCE_DIR}' does not exists")
  endif()
  include_directories(${ANTs_SOURCE_DIR}/Temporary)
  include_directories(${ANTs_SOURCE_DIR}/Tensor)
  include_directories(${ANTs_SOURCE_DIR}/Utilities)
  include_directories(${ANTs_SOURCE_DIR}/Examples)
  include_directories(${ANTs_SOURCE_DIR}/ImageRegistration)
  if(NOT (EXISTS "${ANTs_LIBRARY_DIR}" AND IS_DIRECTORY "${ANTs_LIBRARY_DIR}"))
    message(FATAL_ERROR "ANTs_LIBRARY_DIR: '${ANTs_LIBRARY_DIR}' does not exists")
  endif()
  link_directories(${BRAINSTools_LIBRARY_PATH} ${BRAINSTools_CLI_ARCHIVE_OUTPUT_DIRECTORY} ${ANTs_LIBRARY_DIR})
  set(ANTS_LIBS antsUtilities)
endif()
```

After this PR merges, that entire block can be replaced with:

```cmake
if(USE_ANTS)
  find_package(ANTS CONFIG REQUIRED)
endif()
```

(and downstream targets switch from `${ANTS_LIBS}` to `ANTS::antsUtilities`).

The smoke-test repo's `main.cxx` mirrors `BRAINSCommonLib/BRAINSFitSyN.h`'s actual include list verbatim — so a green smoke test is direct evidence the BRAINSTools migration will work.

</details>

<details>
<summary>Why this supersedes #1656 instead of rebasing it</summary>

#1656 was 348 commits behind master, marked WIP for 2 years, and had four substantive defects beyond the rebase conflict:

| Issue in #1656 | Consequence |
|---|---|
| `install(FILES "ANTSConfig.cmake" ...)` referenced a file that was never added to the PR | `cmake --install` would fail |
| Export-set name mismatch: `${ANTSTargets}` (variable list) vs. `antsTargets` (set name) vs. `set(ANTSTargets ...)` (different case) | Three different things in three places |
| No `EXPORT ...` clause on any `install(TARGETS ...)` call | The `install(EXPORT)` would have nothing to export |
| No `find_dependency(ITK)` in any config file | Downstream `find_package(ANTS)` wouldn't pull ITK |

Per the takeover protocol, the right move was a fresh branch off current master with `Co-Authored-By: @dzenanz` attribution carrying the original design intent forward.

</details>

<details>
<summary>Design choices</summary>

**`configure_package_config_file()` + `@PACKAGE_INIT@`** — the modern (CMake ≥ 3.0) idiom; emits the `set_and_check` / `check_required_components` machinery and computes `PACKAGE_PREFIX_DIR` correctly even after relocation.

**`SameMajorVersion` compatibility** in `write_basic_package_version_file` — appropriate for ANTs's `MAJOR.MINOR.PATCH = 2.6.5` versioning where major bumps imply API breaks.

**`ANTS::` namespace** for imported targets — standard CMake convention; prevents collisions if a downstream project happens to have its own `antsUtilities` target.

**`BUILD_INTERFACE` + `INSTALL_INTERFACE` include-dir generator expressions** on `antsUtilities` — symmetric coverage of the build-tree `export()` form (developers building directly against the ANTs build tree) and the install-tree form (downstream consumers using `find_package(ANTS)` against an installed prefix).

**Public-header install for 6 subdirectories** (`Examples/`, `Utilities/`, `ImageRegistration/`, `ImageSegmentation/`, `Tensor/`, `Temporary/`) — chosen to exactly match the directories that real downstream consumers (BRAINSTools) currently put into their `include_directories()` block. 310 headers land at `<prefix>/include/ANTs/<subdir>/`. Headers from `Examples/include/` (the nested per-CLI-app headers) come along automatically via the recursive `install(DIRECTORY)` walk; they were already on BRAINSTools's effective search path.

**No `find_dependency(libzip)`** even when `USE_TractographyTRX=ON` — discovery during this PR's verification showed the installed ITK references the vendored `libzip.a` by absolute path (`IMPORTED_LOCATION_RELEASE` in `ITKTargets-release.cmake`), not as the named `libzip::zip` target. So no consumer-side libzip discovery is needed; ITK self-contains it.

**Guarded by `NOT ANTS_INSTALL_BIN_ONLY`** — package-config install and header install only run when libraries are being installed. A pure-bin-only install (Docker minimal image, etc.) still works unchanged.

</details>

<details>
<summary>Local verification — observed output</summary>

After installing this PR to `/tmp/ants-install/` and running the smoke-test repo's `./run.sh`:

```
==== ANTS package summary ====
ANTS_VERSION         = 2.6.5
ANTS_USE_VTK         = OFF
Imported targets visible in this directory:
  ANTS::antsUtilities
  ANTS::antsRegistration
  ANTS::N4BiasFieldCorrection
  ... (+ ~80 other ANTS:: targets)
==== Consumer test configured successfully ====
[1/2] Building CXX object CMakeFiles/ants_consumer_smoke.dir/main.cxx.o
[2/2] Linking CXX executable ants_consumer_smoke

==== Running smoke test executable ====
ANTs downstream smoke test
  ConvertToLowerCase('HELLO ANTS') -> 'hello ants'  [libantsUtilities symbol resolved]
  itk::Image<float,3> instance created (size=[2, 2, 2])  [ITK transitive link]
  itk::ANTSAffine3DTransform<double> created (NumberOfParameters=13)  [ANTs ImageRegistration/ header reach]
  ANTs runtime version: 2.6.5.post69-g1231b35  [ANTsVersionConfig.h reach]
  PASS
```

The verification surfaced three real defects during development that an "author and push" workflow would have missed:

1. `find_dependency(libzip)` propagated `REQUIRED` from the outer `find_package(ANTS REQUIRED)` (the `QUIET` hint doesn't affect REQUIRED-ness) — broke on systems where libzip lacks a cmake config (Homebrew). Resolution: removed entirely, since installed ITK already vendors libzip.
2. `ANTS_ITK_VERSION_ID` was empty because the variable lives in the SuperBuild scope, not the inner ANTS scope. Resolution: dropped the version pin; `find_dependency(ITK)` matches whatever ITK the install tree references.
3. First version of the consumer smoke test couldn't `#include "ANTsVersionConfig.h"` because ANTs didn't install its public headers. Resolution: added `install(DIRECTORY)` for the 6 public-API subdirs + `$<INSTALL_INTERFACE:include/ANTs/...>` generator expressions, so 310 headers now land at `<prefix>/include/ANTs/<subdir>/`.

</details>

<!--
provenance: claude-code session 2026-05-12
supersedes: ANTsX/ANTs#1656 (by @dzenanz, WIP since 2024-01-16)
closes: ANTsX/ANTs#1369
key_facts:
  config_install_dir: ${CMAKE_INSTALL_LIBDIR}/cmake/ANTS
  header_install_dir: include/ANTs/{Examples,Utilities,ImageRegistration,ImageSegmentation,Tensor,Temporary}/
  exported_target_namespace: ANTS::
  package_version_compatibility: SameMajorVersion
  itk_dependency: find_dependency(ITK) -- no version pin
  libzip: not re-found downstream; ITK vendors libzip.a
  verification: built from scratch + installed to /tmp/ants-install + downstream
                find_package(ANTS) consumer at https://github.com/hjmjohnson/ANTsDependantCMakeSmokeTest passed.
related_files:
  CMake/ANTSConfig.cmake.in (new)
  ANTS.cmake (new install(DIRECTORY) header block + install(EXPORT) block)
  Examples/CMakeLists.txt (EXPORT ANTSTargets threaded through 5 install(TARGETS) sites + BUILD/INSTALL_INTERFACE include dirs on antsUtilities)
verification_repo: hjmjohnson/ANTsDependantCMakeSmokeTest
followup:
  - migrate BRAINSTools to use find_package(ANTS) instead of the manual
    include_directories + link_directories block.
  - close #1656 after this PR merges; comment posted there cross-links here.
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `301f40d0948c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.