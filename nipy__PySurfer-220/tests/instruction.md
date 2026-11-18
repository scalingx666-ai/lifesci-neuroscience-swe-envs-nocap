# Issue

**Title:** BUG: Add 'center' as a data property

## Description

Fixes an error I get when opening a `TimeViewer` complaining about `'center'` missing from the data properties dict.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b720548ab4f8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.