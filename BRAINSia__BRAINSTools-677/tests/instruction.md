# Issue

**Title:** COMP: Report failure diagnostics and upload the logs needed to debug them

## Description

On failure, writes disk, memory, failed-test, and ExternalProject error-log tails to the job summary, and uploads the logs needed to debug a failed build.

Split from #663 (workflow hardening), one topic per PR; the seven are independent and merge cleanly in any order.

<details>
<summary>What changes</summary>

SlicerExecutionModel and ANTs build with `LOG_*` on, so their compiler output is in `*-stamp/*.log` and never reaches the job log. The new `Summarize failure` step shows the tail of any non-empty error log and the failed-test list. The log artifact now includes those ExternalProject logs and the CMake, CTest build, configure, and test logs, and is kept 14 days. `LastSubmit*.log` is deliberately not uploaded because the submit step runs with the CDash token.

</details>

<details>
<summary>Testing</summary>

- `actionlint` is clean (apart from a style note already in the file) and `pre-commit run --all-files` passes. The combined change passed CI on #663; this topic alone is validated by this PR's own run.
- The summary script was run against a fake build tree and listed the failed tests and the tail of the right error log.
- Not exercised before merge: the artifact globs need a failing run.

</details>

<details>
<summary>AI disclosure</summary>

Claude Code wrote the change and ran the checks listed above. The author reviewed the diff.

</details>

<!--
provenance: claude-code session 2026-10-31
split_from: 663 (failure diagnostics)
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d26b71c4d197`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.