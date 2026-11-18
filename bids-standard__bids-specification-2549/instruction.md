# Issue

**Title:** chore: Bump dependency pins

## Description

This is intended to cleanup the various automatic update PRs. It:

1) Bumps all GitHub actions and pins to hashes, as is recommended practice.
2) Bumps all pre-commit environments and pins to hashes.
3) Updates the build environments to Python 3.14.
4) Moves the spec building dependencies into the `dev` group, which dependabot should treat as lower priority. The threat model of constant dependabot upgrades doesn't generally apply to documentation builds.
5) Updates locked dependencies with a 1 week cooldown.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2f52cc9d4858`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.