# Issue

**Title:** ENH: Remove unnecessary `Cython` package dependendency

## Description

Remove unnecessary `Cython` package dependendency: WMA does not contain C extension code for Python.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e1b19a05d0f8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.