# Issue

**Title:** COMP: Update oneTBB to v2023.2.0

## Description

Update the superbuild's oneTBB from v2022.3.0 to v2023.2.0 (latest release, 2026-10-28). The build also sets `TCM_BUILD=OFF`, because 2023.2.0's new Thread Composability Manager build fails to link on macOS (uxlfoundation/oneTBB#2241).

<details>
<summary>Changes</summary>

- `GIT_TAG` now comes from `tbb_ver` (`v2023.2.0`), so the tag and the version in the project description cannot drift apart.
- `tbb_ver` was set inside the `if(NOT DEFINED git_protocol)` guard, so it was empty whenever `git_protocol` was already defined. It is now set unconditionally.
- `-DTCM_BUILD:BOOL=OFF`: the TCM target passes GNU ld's `-Wl,--version-script=lin.def` under `elseif (UNIX)`, which matches macOS, and Apple ld fails with `unknown options: --version-script`. TCM is an optional runtime plug-in that BRAINSTools does not use.

The 2023.0, 2023.1, and 2023.2 release notes list only additions, with no removals or deprecations. ITK (`Module_ITKTBB`) and VTK (SMP backend) call `find_package(TBB CONFIG)` with no version argument, so neither needs a change.

</details>

<details>
<summary>Local testing (macOS arm64, AppleClang 21, CMake 3.26.6)</summary>

- Full superbuild rebuild: TBB, ITKv5 (`Module_ITKTBB=ON`), VTK (TBB SMP), ANTs, and BRAINSTools all reconfigured and rebuilt against the new TBB. The installed `oneapi/tbb/version.h` reports 2023.2.
- `ctest` on the inner build: **559/559 passed** (609 s).
- `pre-commit run --all-files`: passed.
- Not tested locally: Linux and Windows. CI is the first run on those.

Note for existing local build trees: because of `UPDATE_DISCONNECTED TRUE`, the old TBB checkout is kept after the tag changes. The build succeeds but still uses 2022.3. Delete `<build>/{tbb,tbb-prefix,tbb-Release-build}` once before rebuilding. CI clones EP sources fresh and is not affected.

</details>

<details>
<summary>AI assistance</summary>

Prepared with Claude Code (Opus 5.5). It made the version bump, diagnosed the macOS TCM link failure and matched it to the upstream issue, and ran the local rebuild and tests. The human author reviewed the diff and the test results.

</details>

<!--
provenance: claude-code session 2026-11-07
key_facts: oneTBB v2022.3.0 -> v2023.2.0; TCM_BUILD=OFF for oneTBB#2241; ctest 559/559 on macOS arm64
related_files: SuperBuild/External_tbb.cmake
logs: .devlocal/logs/tbb2023_superbuild_20261107_1651_notcm.log, .devlocal/logs/tbb2023_ctest_20261107_1656.log
post_merge_action: drop TCM_BUILD=OFF once oneTBB#2241 is fixed in a release; forest refresh of existing trees needs tbb EP dirs wiped once
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `479f147b8a9b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.