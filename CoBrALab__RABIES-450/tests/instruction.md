# Issue

**Title:** chore: add workflow dispatch to docker-build workflow

## Description

<!-- This is an auto-generated comment: release notes by coderabbit.ai -->
## Summary by CodeRabbit

* **Chores**
  * CI workflow can now be started manually to trigger Docker image builds.
  * Docker image tagging now falls back to a "manual" tag when a PR number is unavailable, ensuring consistent tags for manual runs.
<!-- end of auto-generated comment: release notes by coderabbit.ai -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `940d6c6fa929`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.