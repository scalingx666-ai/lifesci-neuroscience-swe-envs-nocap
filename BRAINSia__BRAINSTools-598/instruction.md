# Issue

**Title:** ENH: Consume ANTs via find_package(ANTS) instead of manual source-tree paths

## Description

**Draft — depends on .** Do not merge until that PR lands and an ANTs revision containing it is pinned upstream.

Collapses the 20-line manual `include_directories` / `link_directories` / `ANTS_LIBS` ANTs detection block in `BRAINSTools.cmake` into `find_package(ANTS CONFIG REQUIRED)`, using ANTs's new package-config layer from . Net `-14` lines, no call-site changes outside the two edited files.

<details>
<summary>What changes</summary>

```diff
-if(USE_ANTS)
-  if(NOT (EXISTS "${ANTs_SOURCE_DIR}" AND IS_DIRECTORY "${ANTs_SOURCE_DIR}"))
-    message(FATAL_ERROR "ANTs_SOURCE_DIR: '${ANTs_SOURCE_DIR}' does not exists")
-  endif()
-  include_directories(${BOOST_INCLUDE_DIR})
-  include_directories(${ANTs_SOURCE_DIR}/Temporary)
-  include_directories(${ANTs_SOURCE_DIR}/Tensor)
-  include_directories(${ANTs_SOURCE_DIR}/Utilities)
-  include_directories(${ANTs_SOURCE_DIR}/Examples)
-  include_directories(${ANTs_SOURCE_DIR}/ImageRegistration)
-  if(NOT (EXISTS "${ANTs_LIBRARY_DIR}" AND IS_DIRECTORY "${ANTs_LIBRARY_DIR}"))
-    message(FATAL_ERROR "ANTs_LIBRARY_DIR: '${ANTs_LIBRARY_DIR}' does not exists")
-  endif()
-  link_directories(${BRAINSTools_LIBRARY_PATH} ${BRAINSTools_CLI_ARCHIVE_OUTPUT_DIRECTORY} ${ANTs_LIBRARY_DIR})
-  set(ANTS_LIBS antsUtilities)
-endif()
+if(USE_ANTS)
+  find_package(ANTS CONFIG REQUIRED)
+  include_directories(${BOOST_INCLUDE_DIR})
+  link_directories(${BRAINSTools_LIBRARY_PATH} ${BRAINSTools_CLI_ARCHIVE_OUTPUT_DIRECTORY})
+  set(ANTS_LIBS ANTS::antsUtilities)
+endif()
```

The 6 public-API include directories (`Examples/`, `Utilities/`, `ImageRegistration/`, `ImageSegmentation/`, `Tensor/`, `Temporary/`) plus all transitive ITK includes now flow through `ANTS::antsUtilities`'s `INTERFACE_INCLUDE_DIRECTORIES` automatically. Existing `target_link_libraries(... ${ANTS_LIBS} ...)` call sites (`BRAINSCommonLib`, `BRAINSFit`) are unchanged because the namespaced imported target is a drop-in for the bare library name.

</details>

<details>
<summary>SuperBuild plumbing (External_ANTs.cmake)</summary>

```diff
-set(${proj}_REPOSITORY "https://github.com/ANTsX/ANTs.git")
-## set(${proj}_REPOSITORY "https://github.com/BRAINSia/ANTs.git")
-set(${proj}_GIT_TAG
-  1766655ca9e00c0b95c765fea2d2468436c94ceb  # 20260325 - Latest master
-)
+set(${proj}_REPOSITORY "https://github.com/hjmjohnson/ANTs.git")
+set(${proj}_GIT_TAG
+  31faec49e3e82dc39f21139d70034be65dfc9a95  # 20260512 - antsconfig-cmake-modernize (ANTsX/ANTs#1973)
+)
```

```diff
 set(${proj}_LIBRARY_DIR ${CMAKE_INSTALL_PREFIX}/lib)
+set(ANTS_DIR ${CMAKE_INSTALL_PREFIX}/lib/cmake/ANTS)
 mark_as_superbuild(
   VARS
      ${proj}_SOURCE_DIR:PATH
      ${proj}_LIBRARY_DIR:PATH
+     ANTS_DIR:PATH
   LABELS "FIND_PACKAGE"
   )
```

The `ANTS_DIR` propagation is what lets the inner BRAINSTools build's `find_package(ANTS CONFIG REQUIRED)` locate the just-installed `ANTSConfig.cmake` without needing `CMAKE_PREFIX_PATH` tweaks.

</details>

<details>
<summary>Release coordination — what has to happen before this can merge</summary>

| Step | Status |
|---|---|
| 1. ANTsX/ANTs#1973 reviewed + merged (adds `ANTSConfig.cmake`, `ANTSTargets.cmake`, `ANTS::antsUtilities`, public-header install, and `ANTS_INCLUDE_DIRS`/`ANTS_LIBRARIES` legacy-list vars) | Draft, glance-approved by @dzenanz, pending Friday verification |
| 2. ANTs ships a tagged release containing #1973 | Pending step 1 |
| 3. Update this PR's `External_ANTs.cmake` `${proj}_REPOSITORY` back to `https://github.com/ANTsX/ANTs.git` and `GIT_TAG` to the release SHA | Will do after step 2 |
| 4. Mark this PR ready for review | After step 3 |

Until step 3, the temporary repo pointer at `hjmjohnson/ANTs` keeps the SuperBuild building from the PR branch directly so the BRAINSTools side can be exercised in CI / dev environments without waiting for an ANTs release.

</details>

<details>
<summary>Verification</summary>

ANTs PR #1973's package-config was exercised end-to-end with an independent downstream consumer that mirrors `BRAINSCommonLib/BRAINSFitSyN.h`'s exact ANTs includes:

- Repo: https://github.com/hjmjohnson/ANTsDependantCMakeSmokeTest
- Exercises: `#include "antsUtilities.h"`, `"itkantsRegistrationHelper.h"`, `"ReadWriteData.h"`, `"itkANTSAffine3DTransform.h"`, `"ANTsVersionConfig.h"`; calls `ConvertToLowerCase` (real symbol in `libantsUtilities`), instantiates `itk::ANTSAffine3DTransform<double>`, and `itk::Image<float,3>`.
- Result: green — all the headers BRAINSTools needs are reachable through `ANTS::antsUtilities` after `find_package(ANTS)`, and the link interface resolves.

Same machinery is also being exercised independently in .

Full BRAINSTools SuperBuild verification will run once CI starts on this PR; given the inner-build changes are mechanical (just swapping the same set of include directories for the same target's interface, and the same library name for the namespaced imported target), the risk is low.

</details>

<!--
provenance: claude-code session 2026-05-12
depends_on: ANTsX/ANTs#1973
related: InsightSoftwareConsortium/ITKANTsWasm#41
temporary_fork_pointer: hjmjohnson/ANTs (must revert to ANTsX/ANTs before ready-for-review)
key_facts:
  diff_size: -14 net lines (23 -> 9)
  consumer_pattern_change: source-tree includes + manual link_directories -> imported target
  ants_dir_propagation: mark_as_superbuild ANTS_DIR=${CMAKE_INSTALL_PREFIX}/lib/cmake/ANTS
  verification_repo: hjmjohnson/ANTsDependantCMakeSmokeTest
ready_for_review_blockers:
  - ANTsX/ANTs#1973 merged
  - ANTs release tagged containing #1973
  - This PR's GIT_TAG updated to point at ANTsX/ANTs at that release
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `67acae445449`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.