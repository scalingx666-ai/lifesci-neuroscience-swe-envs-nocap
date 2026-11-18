# Issue

**Title:** fix(server): Coerce string dates in assembleMetadata

## Description

One more bug for DOI syncing features. The string case needs to be handled to prevent an error when fetching snapshot data from the worker.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `431323fd142d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.