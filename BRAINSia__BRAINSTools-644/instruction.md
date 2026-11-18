# Issue

**Title:** COMP: Add swap to the Ubuntu CI runner for cold GCC 15 builds

## Description

The first CI build on the Ubuntu 26.04 image (`ubuntu-latest` since 2026-10-19) lost its runner during a cold VTK compile, most likely to memory exhaustion. This adds a 16 GB swap file, moves compiler temp files off the RAM-backed `/tmp`, and logs memory use during the SuperBuild. Found on #643, whose Ubuntu job never reached BRAINSTools code.

<details>
<summary>Diagnosis</summary>

| | Last pass (2026-10-10) | #643 (2026-10-26) |
|---|---|---|
| Image | ubuntu-24.04 | ubuntu-26.04 |
| GCC | 13.3.0 | 15.2.0 |
| ccache | restored from `main` | no cache (repo had none) |
| `/tmp` | disk | 8 GB tmpfs (RAM) |
| Swap | none | none |

- VTK `Common/Core` dispatch units slowed from about 1 s to 13, 20, and 40 s each. Then the log was silent for 3.5 minutes until both ninja levels reported "interrupted by user" (exit 143).
- No `if: always()` step ran (ccache stats, CDash submit, log upload), so the runner was lost rather than the step failing.
- The cache was empty because `main` has not built since 2026-10-10, and GitHub evicts a cache that has gone unread for 7 days. Any PR opened after a quiet week therefore builds every external project from scratch.
- The macOS job failed for an unrelated reason: "The job was not acquired by Runner of type hosted even after multiple attempts", a GitHub capacity problem with arm64 macOS runners.

</details>

<details>
<summary>Testing and AI disclosure</summary>

- `actionlint` reports no new findings (two existing ones remain), and `pre-commit run --all-files` passes.
- The memory logger and its `EXIT` trap were exercised locally in bash; the logger is skipped where `free` is absent (macOS).
- This PR's own CI run is the test of the fix. The Ubuntu job should finish a cold build, and the `[mem]` lines should show swap in use.

Claude Code (claude-opus-5-5) compared the job logs of the failed and last passing runs, identified the image change, and drafted the workflow change.

</details>

<!--
provenance: claude-code session 2026-10-26
failed_run: 40357715504 (PR 643), last_pass: 38062990903
follow_up: consider a weekly scheduled build on main to keep ccache under the 7-day eviction window
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b07a314ebf86`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.