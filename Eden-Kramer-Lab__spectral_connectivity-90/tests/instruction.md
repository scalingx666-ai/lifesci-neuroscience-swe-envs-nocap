# Issue

**Title:** Report zizmor findings inline instead of uploading SARIF

## Description

Every master run since #81 (2026-09-25) failed only in `Code Quality`: zizmor itself passed, but the action's default SARIF upload needs `security-events: write`, which this workflow does not grant (SPEC 8 read-only default) and could not use anyway, since the repository has no code scanning. With the upload skipped and findings reported as workflow annotations, the quality gate passes and the build/publish jobs are no longer skipped, so a 3.0 tag can publish.

Phase 1 of the plan in #89 (stacked on it; retarget to `master` once #89 merges).

Validation: `uvx zizmor --persona regular .github/workflows/release.yml` reports no findings; the `Code Quality` job on this branch's run must succeed.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bcc16a810ec8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.