# Issue

**Title:** Start the dev server for frontend tests

## Description

Previously, a typo meant that the dev server was not actually started.
Concerningly, this did not lead to a failure of the server start step,
or of the karma tests which run afterwards and presumably depend on the
dev server.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d9d5177351c0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.