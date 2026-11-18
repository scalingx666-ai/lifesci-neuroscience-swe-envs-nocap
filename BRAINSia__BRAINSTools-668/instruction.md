# Issue

**Title:** COMP: Update ANTs to the latest main

## Description

Updates ANTs to the latest `main` and passes it the ITK major version it needs.

<details>
<summary>Details and testing</summary>

- ANTs main is 113 commits ahead of the pinned version and builds against both ITK release-5.4 and ITK main. It no longer includes the VNL FFT headers that ITK 6 stopped installing.
- ANTs main configures for ITK 6 by default and stops when it finds another major version, which includes the ITK 5.4 this SuperBuild builds. The SuperBuild now passes `ITK_VERSION_MAJOR` derived from the ITK version it builds.
- A full CI-style SuperBuild (macOS arm64, ccache off) with this ANTs on ITK 5.4.7 passed all 507 tests CI runs, 0 failed; it was validated together with the minimal-VTK and pin PRs. ANTs also built against ITK main.
- Rebased onto `main` after #669 (ITK 6 support) merged. Both PRs add arguments to the ANTs options list; the rebase keeps both the zlib handoff and the ITK major version.

</details>

<details>
<summary>AI disclosure</summary>

Claude Code wrote the change and ran the checks listed above. The author reviewed the diff.

</details>

<!--
provenance: claude-code session 2026-10-31
related: rebased 2026-10-31 after comp-superbuild-itk6-support (#669) merged
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5961fc33bb95`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.