# Issue

**Title:** Add additional time filtering in extractors

## Description

While there was no issue in standard conditions using segments for filtering + TimedArray, this PR adds an extra filtering to avoid any weird behavior in non-standard settings

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6107ce04f8ca`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.