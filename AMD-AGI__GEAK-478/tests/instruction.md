# Issue

**Title:** fix(e2e): select matching upstream trace by time

## Description

## Summary

  Fix incorrect upstream TraceLens trace selection in the E2E workflow.

  Previously, traces under `runs/roofline` from `TraceLens` were sorted by the full path string. Since the path contains a random run ID before the benchmark timestamp, GEAK could select the oldest trace instead of the latest one.

  For example:

  - Old trace: `f76ffea9.../benchmark_sglang_20260916_080028`
  - New trace: `305afa5a.../benchmark_sglang_20260917_011859`

  Old path-sorting rule: `f76ffea9... > 305afa5a...`, so `sorted(matches)[-1]` returned the older trace.

<img width="334" height="477" alt="A1A2EC8E-909C-43c3-9820-F16168A477F6" src="https://github.com/user-attachments/assets/ad477eb8-3620-4849-a1c8-2e6b2ac660a5" />

This change selects traces by the actual benchmark timestamp, excludes artifacts created after the handoff, and freezes artifact discovery before the E2E workflow starts.

  ## Testing

  - `514 passed, 13 subtests passed`
  - Verified with the real Hyperloom handoff; the expected post-optimization trace is selected.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e880a080bd79`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.