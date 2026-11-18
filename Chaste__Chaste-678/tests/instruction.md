# Issue

**Title:** Remove gprof from CI

## Description

Also fixes a latent bug with the new CI gating that caused memtest aggregation to display as "failed" when the `ci:all` label was applied when the PR was opened.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `44724ebfbf77`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.