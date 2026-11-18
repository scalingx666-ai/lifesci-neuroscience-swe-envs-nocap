# Issue

**Title:** ci: SHA-pin all GitHub Actions, add Dependabot, drop autoformat

## Description

Based on #158 , review that first

## What

- All GitHub Actions pinned to commit SHAs instead of version tags for supply-chain security
- Bumped to latest releases: checkout v7, setup-python v7, setup-uv v9, codecov v7, git-auto-commit v7
- Added Dependabot (`github-actions` ecosystem, weekly) to auto-update SHA comments
- Removed `autoformat.yml` — redundant with pre-commit hooks + `ruff.yml` CI check; also removes `contents: write` permission surface

## Why

Version tags are mutable — a compromised release can inject malicious code without changing the tag. Commit SHAs are immutable. Dependabot keeps the pins current without manual effort.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `deb815c3b8c0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.