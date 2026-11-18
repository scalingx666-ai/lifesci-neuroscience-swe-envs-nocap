# Issue

**Title:** COMP: Run the tests under ASan and UBSan in the weekly CI build

## Description

Run the inner BRAINSTools tests under AddressSanitizer and UndefinedBehaviorSanitizer in the weekly scheduled CI build (and on manual runs), part of #631. Pull requests are unaffected.

**Merge after #657**, which fixes the one BRAINSTools defect this check finds; without it the first weekly run fails `BRAINSFitTest_BSplineScaleRotationHeadMasksUShort`.

<details>
<summary>What the leg does</summary>

On the Ubuntu job, only for `schedule` and `workflow_dispatch` events, after the normal build, tests, and ccache save:
1. Reconfigure the inner `BRAINSTools-Release-EPRelease-build` with `-fsanitize=address,undefined -fno-sanitize=pointer-overflow -fno-sanitize-recover=undefined` and rebuild it. ITK, VTK, and ANTs stay uninstrumented; sanitized objects never reach the cache.
2. Run the same test set as the normal job.

Exclusions, each found by running the full suite locally:
- `pointer-overflow`: ITK 5.4 iterators built on unallocated images (`ScanlineFilterCommon::SetupLineOffsets`, the `ImageRegistrationMethodv4` virtual domain) offset a null buffer pointer inside ITK templates instantiated in BRAINSTools objects, aborting 28 tests. Suppressing it at run time was unreliable on TBB worker threads, so the check is off at compile time.
- `detect_container_overflow=0`: misfires inside GoogleTest's own test registration, which runs at build time during test discovery.
- `detect_leaks=0`: leaks at exit are not triaged yet.

Not in this PR: CodeQL, the hardened-STL leg, and custom queries from #631.

</details>

<details>
<summary>Testing and AI disclosure</summary>

The same flags and options, applied to a local inner build (macOS, AppleClang) with the mask fix: all 549 non-BCD tests pass. The workflow step itself can only run on GitHub; after merge, `gh workflow run build.yml --ref main`. Workflow validated by pre-commit.

Claude Code (claude-opus-5-5) wrote the step and ran the local sanitizer builds; the author reviewed every line.

</details>

<!--
provenance: claude-code session 2026-10-29
depends_on: #657 (fix-brainsfit-mask-fill)
post_merge_action: dispatch the workflow once on main and check the Sanitizers steps
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `633100231515`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.