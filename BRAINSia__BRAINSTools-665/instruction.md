# Issue

**Title:** COMP: Build and test against ITK main in CI

## Description

Adds CI legs that build and test BRAINSTools against the newest ITK main on every pull request, push, and nightly, as separate "(ITK main)" checks. A manual run can build any ITK repository and ref.

**Expect the "(ITK main)" jobs to be red until the ANTs update (#668) lands** and ITK fixes such as InsightSoftwareConsortium/ITK#7056 merge. The ITK 6 SuperBuild support (#669) has merged. They are not required checks, so they do not block merging; please do not make them required.

<details>
<summary>How it works</summary>

- A `setup` job picks the legs for the event: all four for pull requests, pushes, and manual runs; the release-pinned legs for the weekly cron; the ITK legs for a new nightly cron, which keeps main's ccache warm for pull requests to restore.
- The `itk_repo` and `itk_ref` dispatch inputs (default: `InsightSoftwareConsortium/ITK`, `main`) are resolved to a SHA. The ITK version is read from `CMake/itkVersion.cmake` at that SHA. The repository, SHA, and version go to the SuperBuild as `BRAINSTools_ITKv5_GIT_REPOSITORY`, `BRAINSTools_ITKv5_GIT_TAG`, and `BRAINSTools_ITK_VERSION`.
- Each ref gets its own ccache key prefix, plus a repository hash when the repository is not the default, and a CDash suffix, so it cannot evict the release-pinned caches. These legs skip the weekly sanitizer pass.
- To test an ITK pull request: `gh workflow run build.yml --ref <branch> -f itk_repo=https://github.com/<owner>/ITK.git -f itk_ref=<branch>`.
- The repository input must be an `https://github.com/<owner>/<name>` URL, is validated before use, and reaches the configure step through the environment.

</details>

<details>
<summary>Testing and merge notes</summary>

- `actionlint` is clean; `pre-commit run --all-files` passes.
- The resolve step was run locally for: the release leg, ITK main, a fork branch, and release-5.4 (each gives the expected SHA and version), and refused `--upload-pack=...`, `file://`, `http://`, and a repository with shell metacharacters without running anything.
- Locally, an ITK main build with the companion SuperBuild changes compiles BRAINSTools, ANTs, and SlicerExecutionModel. Of the tests CI runs, 73% pass (135 of 507 fail). Building ITK from the ITK#7056 head instead leaves 14 failures (97% pass): all 121 `Versor` failures are fixed, and the remaining 14 are DWIConvert comparisons under ITK 6.
- Small textual conflict with the workflow-hardening PR (CDash step and timeout).

</details>

<details>
<summary>AI disclosure</summary>

Claude Code wrote the change and ran the checks listed above. The author reviewed the diff.

</details>

<!--
provenance: claude-code session 2026-10-31
related: rebased 2026-10-31 after #662, #664, #666, #669 merged; still conflicts textually with comp-ci-harden-workflows (#663); useful with comp-superbuild-update-ants (#668)
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5961fc33bb95`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.