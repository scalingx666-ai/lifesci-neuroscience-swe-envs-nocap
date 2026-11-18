# Issue

**Title:** ci: add aggregated 'Tests passed' gate job

## Description

## Summary

Adds a single aggregator job, `tests-passed` (display name **Tests passed**), to the `Tests` workflow (`.github/workflows/matlab.yml`). It `needs: matlab-tests` and runs with `if: always()`, failing unless `needs.matlab-tests.result == 'success'`. In other words, it succeeds **only when every leg of the test matrix passes**, and surfaces that as one status check.

## Why

The test matrix is generated dynamically, and its legs differ between `pull_request` runs (a limited MATLAB set) and scheduled runs (the full set) — and the leg names also change as MATLAB versions are added or removed. That makes pinning individual matrix legs as required status checks brittle: a check name that exists on a PR run may not exist on a scheduled run, and vice versa.

A single aggregator job avoids that. Maintainers can require just the one **Tests passed** check on `main` instead of enumerating each matrix entry.

The `if: always()` is deliberate: it ensures the gate still runs when the matrix fails. Without it the job would be skipped, and GitHub treats a skipped required check as non-blocking — which would defeat the purpose.

## Scope

Code change only. This PR does **not** modify branch protection, rulesets, or any repository settings. Enabling **Tests passed** as a required status check on `main` is a follow-up repo setting for maintainers.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `35718852bf75`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.