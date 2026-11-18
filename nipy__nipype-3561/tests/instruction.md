# Issue

**Title:** [REF] Stop using deprecated import internally

## Description

## Summary

Remove internal imports of deprecated `nipype.LooseVersion` for `looseversion.LooseVersion`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2086876aa147`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.