# Issue

**Title:** Decode dcm2niix output with errors=replace

## Description

. Decodes dcm2niix output with `errors="replace"` so non-UTF-8 bytes no longer raise `TypeError` in the warning check.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d36136261352`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.