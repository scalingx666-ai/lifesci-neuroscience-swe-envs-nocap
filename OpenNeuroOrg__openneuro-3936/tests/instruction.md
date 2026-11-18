# Issue

**Title:** feat(app): Add toggle for user profile privacy

## Description

Allow users to opt out of public profiles. This mainly excludes the profile page from indexing. Site admin users can still browse and use the profile pages.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `12e639203109`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.