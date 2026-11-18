# Issue

**Title:** ENH: Name offending channels in fNIRS preprocessing warnings

## Description

## Reference issue (if any)

## What does this implement/fix?

Adds additional warnings to `optical_density` and `tddr` that mention which channels are causing issues so users can ignore known bad channels.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `60720b6219e8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.