# Issue

**Title:** chore(ci): Split pre-release tests into cron job

## Description

This splits pre-release tests into a cron job instead of on every PR/commit. It hasn't happened lately on this repository, but these tests are distracting for PRs that are unrelated.

This sets up the `ci/prerelease` branch to allow triggering these tests intentionally during a PR (such as this one).

@Remi-Gau If you wouldn't mind having a quick look, I would appreciate it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7e0e509b2635`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.