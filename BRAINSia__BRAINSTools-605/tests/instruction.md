# Issue

**Title:** ENH: Make ANTs repo/tag overridable; default to ANTsX/ANTs main

## Description

Make the ANTs external-project repository and revision overridable from the CMake command line, mirroring the existing `BRAINSTools_ITKv5_GIT_REPOSITORY`/`_GIT_TAG` pattern, and default to the primary source (`ANTsX/ANTs`) at its current `main` tip.

<details>
<summary>What changed</summary>

`SuperBuild/External_ANTs.cmake` previously hard-coded the ANTs source:

```cmake
set(${proj}_REPOSITORY "https://github.com/hjmjohnson/ANTs.git")
set(${proj}_GIT_TAG 31faec49…  # antsconfig-cmake-modernize)
```

That pinned SHA lived on a personal-fork PR branch that was later force-pushed, so the EP `git clone` began failing with `fatal: unable to read tree`.

This replaces it with the same `ExternalProject_SetIfNotDefined` mechanism already used for ITK in `External_ITKv5.cmake`:

```cmake
ExternalProject_SetIfNotDefined(${CMAKE_PROJECT_NAME}_${proj}_GIT_REPOSITORY "https://github.com/ANTsX/ANTs.git" QUIET)
ExternalProject_SetIfNotDefined(${CMAKE_PROJECT_NAME}_${proj}_GIT_TAG d2fbf8bd… QUIET)
```

so the source can be selected at configure time:

```bash
-DBRAINSTools_ANTs_GIT_REPOSITORY:STRING=https://github.com/hjmjohnson/ANTs.git
-DBRAINSTools_ANTs_GIT_TAG:STRING=antsconfig-cmake-modernize
```

The default now points at the canonical upstream (`ANTsX/ANTs`) main tip rather than a fork branch.

</details>

<details>
<summary>Local validation</summary>

- Override flow: default reconfigure resolves to `ANTsX/ANTs` @ `d2fbf8bd`; passing `-DBRAINSTools_ANTs_GIT_REPOSITORY=…/ANTsX/ANTs.git -DBRAINSTools_ANTs_GIT_TAG=v2.5.0` is honored in the generated `ANTs-gitclone.cmake`.
- ANTs external project clones, configures, builds, and installs from `ANTsX/ANTs` main inside the SuperBuild.
- Full BRAINSTools build green end-to-end: `find_package(ANTS)` consumes the ANTsX-main ANTS config, and `bin/BRAINSFit` is produced.
- `pre-commit run` clean on the changed file.

</details>

<!--
provenance: claude-code session 2026-06-18, itk_forest_build_testbed
base: BRAINSia/BRAINSTools@26955809 (main)
default_pin: ANTsX/ANTs main d2fbf8bd525f0b9f907b9c6ebd35ab26a4d8927a
override_vars: BRAINSTools_ANTs_GIT_REPOSITORY, BRAINSTools_ANTs_GIT_TAG
mirrors: SuperBuild/External_ITKv5.cmake SetIfNotDefined pattern
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2695580975b3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.