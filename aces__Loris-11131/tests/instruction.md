# Issue

**Title:** Update version number to 29 before release

## Description

This updates the version number to "LORIS 29" for the LORIS 29 release. It is based on the references in #9868 and one more that was found by `git grep`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `19b7104a720b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.