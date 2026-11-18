# Issue

**Title:** Select ITK's Platform threader on Windows at package load

## Description

## Summary

Master's Windows check timed out again after #469 (run 43271275514, e5f5be72). The expression trace shows **every example finished**, through `write_simlr_data_frames` and the final `grDevices::dev.off()` at 17:57:25, and then **the examples R process never exited**. The job sat there until the 45-minute cap.

#469 moved `ITK_GLOBAL_DEFAULT_THREADER=Platform` from the workflow into `tests/testthat.R`, on the assumption that only the tests hung at exit. That was wrong. Any R process that has run a multithreaded ITK filter hangs at exit on Windows with ITK's default thread pool. That includes the examples process, and it's very likely why **r-universe's ANTsR Windows check stalls in "checking examples"**.

- **`.onLoad`** now sets `ITK_GLOBAL_DEFAULT_THREADER=Platform` on Windows only, unless it's already set. ITK reads the variable when it first creates its threader, on the first filter call, so load time is early enough. This covers examples, tests, r-universe and CRAN checks, and users' scripts.
- **`tests/testthat.R`** keeps its setting as a backup; I shortened the comment.
- **NEWS** has a new FIX entry.
- **Workflow:** I've left the step out, so this PR's Windows job only passes if the `.onLoad` route works.

## Checking it
This PR's `windows-latest` job should show `checking examples ... OK` and `checking tests ... OK`, and finish well within the 45-minute cap.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e5f5be722170`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.