# Issue

**Title:** enhance neuronjson test; fix use of /all?fields=bodyid

## Description

Fixes bug reported by Philipp in just requesting `bodyid` via `fields` query string: `/all?fields=bodyid`.  This will return slightly different format than `/keys` but should just work as expected instead of the previously erroneous return of nothing. @stuarteberg @schlegelp

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9361bd979130`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.