# Issue

**Title:** COMP: Add ITK 6 support to the SuperBuild

## Description

Lets the SuperBuild build ITK 6 (ITK main): a `BRAINSTools_ITK_VERSION` setting, legacy removal only below ITK 6, and the SuperBuild's zlib handed to ANTs under ITK 6.

<details>
<summary>What changes</summary>

- `BRAINSTools_ITK_VERSION` (default 5.4) names the ITK the SuperBuild builds and is used for `ITK_DIR`.
- `ITK_LEGACY_REMOVE` and `ITK_FUTURE_LEGACY_REMOVE` are on only below ITK 6. In ITK 6, `UseITK.cmake` is a fatal error under `ITK_FUTURE_LEGACY_REMOVE`, which blocks SlicerExecutionModel at configure time. Enabling it for ITK 6 is deferred until the downstream migration (`find_package(ITK)` plus `itk_generate_factory_registration()`).
- ITK 6 exports its zlib dependency as `ZLIB::ZLIB` instead of an absolute path, so ANTs resolved the system zlib and failed to link ITK's `slicer_zlib_*` symbols. ANTs now gets the SuperBuild zlib when the version is 6 or newer.

</details>

<details>
<summary>Testing</summary>

- An ITK main (6.0) SuperBuild with these changes, the ANTs update, and minimal VTK builds BRAINSTools, ANTs, and SlicerExecutionModel. The release-style build is unchanged for ITK 5.4, where the flags stay on.
- Of the 507 tests CI runs against ITK 6, 73% pass. The failures are not caused by this change: ITK 6's stricter `Versor` check (InsightSoftwareConsortium/ITK#7056 fixes it) and a DWIConvert comparison.
- Small textual conflict with the ANTs update PR.

</details>

<details>
<summary>AI disclosure</summary>

Claude Code wrote the change and ran the checks listed above. The author reviewed the diff.

</details>

<!--
provenance: claude-code session 2026-10-31
related: conflicts textually with comp-superbuild-update-ants; works with comp-ci-itk-legs
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f686138b2762`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.