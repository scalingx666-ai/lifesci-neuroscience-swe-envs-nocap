# Issue

**Title:** Group dependabot updates

## Description

Adds a `groups` section to .github/dependabot.yml so dependabot PRs are grouped per ecosystem, matching the convention applied across other repos.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `44f0f61db123`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.