# Issue

**Title:** Keep materialized candidates independent of protected originals

## Description

A task may hardlink an editable kernel to its protected ORIGINAL. Materializing that task preserved the alias, so applying a candidate patch in place also overwrote ORIGINAL and caused native qualification to reject the workspace. Copy regular hardlink names independently at the materialization boundary; explicit shared-input and vendor symlinks remain shared.

The regression reproduces the failure through the real composer materializer, source transplant and native capture/reader, then checks distinct files and unchanged ORIGINAL. The existing shared-input tests also check this invariant across generations.

Validation: 73 composer tests and 13 materializer tests passed; the new regression failed before the production change. GPU/runtime efficacy is not claimed by these CPU fixtures.

Stacked on #532; this PR adds only the materialization fix and its regression coverage.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `241c959a95b9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.