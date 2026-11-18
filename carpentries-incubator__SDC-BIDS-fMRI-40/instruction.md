# Issue

**Title:** urgent: fix workflows

## Description

This pull request updates the workflows for this lesson.

There are two items that are changed:

1. r-lib/actions/setup-r now uses `@v2` instead of `@master` as the default tag
2. the `set-output` GHA workflow command has been updated as it was deprecated.

see  for details

If you have any questions, contact @zkamvar

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `128f3c3fbefd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.