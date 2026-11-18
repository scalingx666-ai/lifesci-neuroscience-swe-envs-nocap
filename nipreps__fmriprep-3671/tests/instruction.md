# Issue

**Title:** chore: Fix py310-min tests on CI [LTS]

## Description

This fixes CI failures on the LTS branch related to py310-min. It also removes pre-release tests altogether. Adding a cronjob prerelease test will be a separate PR against master.

Minor additional change of separating out the tox environment build and run steps, which can help quickly distinguish install from test failures.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9291900e0fc4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.