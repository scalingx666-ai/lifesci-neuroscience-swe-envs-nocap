# Issue

**Title:** Allow deferred preference validation for device categories

## Description

This implements a solution to #1340 and brian-team/brian2cuda#281 that doesn't require any fundamental changes: unknown preferences that are in a `devices.*` category do not raise errors but stay unvalidated. They will be validated when the `brian2cuda` package registers the preference.
CC @SinYita

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3b650019e25d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.