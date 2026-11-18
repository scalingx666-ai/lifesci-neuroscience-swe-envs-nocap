# Issue

**Title:** docker improvements

## Description

Move AHBA preprocessing to a separate container - leads to more reliable CIrcleCI builds.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d4d2e4ed3d3d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.