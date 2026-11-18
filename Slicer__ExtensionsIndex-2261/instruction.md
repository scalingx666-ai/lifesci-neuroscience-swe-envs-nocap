# Issue

**Title:** Update scm_revision in SlicerOpenLIFU to be "main"

## Description

The version was pinned to a pretty old one -- I think we should not have pinned it to begin with.

@arhowe00 for visibility

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aab2e2b5e0b5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.