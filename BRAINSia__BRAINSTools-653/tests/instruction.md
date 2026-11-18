# Issue

**Title:** COMP: Fetch GoogleTest by default instead of preferring an installed copy

## Description

Fetch and build GoogleTest with the project's own flags by default; `BRAINSTools_USE_SYSTEM_GTest=ON` opts back into `find_package(GTest)`.

<details>
<summary>Why</summary>

`CMake/BRAINSToolsGTest.cmake` tried `find_package(GTest)` first and fetched only on failure, so a package-manager copy silently won. On macOS the Homebrew `libgtest.a` is built for a newer deployment target than the project, and every GTest executable link emitted two `ld` deployment-target warnings (over 2,000 per full build). Fetching googletest 1.17.0, the version ITK bundles, builds it with `CMAKE_OSX_DEPLOYMENT_TARGET` and the project's compiler, which is also what CI machines without a system GTest already did.

Verified locally on macOS: reconfigure fetches and builds gtest, the GTest executables link without the warnings, and full `ctest` passes. `pre-commit run --all-files` passes.

</details>

<details>
<summary>AI disclosure</summary>

The cause was traced and the macro edited with assistance from Claude Code; the author reviewed the change.

</details>

<!--
provenance: claude-code session 2026-10-28
post_merge_action: none
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `60b069efa672`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.