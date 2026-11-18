# Issue

**Title:** chore: Pin GitHub actions by hash

## Description

Updates all actions and switches to using hashes. Obviates all actions-related dependabot PRs.

Migrating to pixi should obviate the pip dependabot PRs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e21231d0c6ab`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.