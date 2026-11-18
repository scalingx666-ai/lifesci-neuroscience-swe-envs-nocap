# Issue

**Title:** macOS 10.15 deprecated, update github actions

## Description

github actions macOS 10.15 runner is deprecated, updated to macOS 11 and 12.

see:
https://docs.github.com/en/actions/using-github-hosted-runners/about-github-hosted-runners

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f4883d373b08`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.