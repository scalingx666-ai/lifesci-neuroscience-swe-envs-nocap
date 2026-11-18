# Issue

**Title:** Add weekly release-notes audit workflow

## Description

Weekly workflow that flags merged PRs not yet cited on the changes-since-last-release page, collected in #641. No per-PR status check.

.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e4165a56b4dd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.