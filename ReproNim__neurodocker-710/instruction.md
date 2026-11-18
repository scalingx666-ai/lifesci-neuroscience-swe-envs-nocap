# Issue

**Title:** pre-commit → prek

## Description

Attempt to use [`prek`](https://prek.j178.dev/) instead of `pre-commit`.

This PR switches from `pre-commit` to `prek` mostly in CI.

Since `prek` is a drop-in replacement for `pre-commit`, either of them can be used on developers' computers, based on the same `.pre-commit-config.yaml` file, so that developer can change at their pace without disruption.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `188a7298b37f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.