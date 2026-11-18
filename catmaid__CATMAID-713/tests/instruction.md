# Issue

**Title:** Remove public field from Project

## Description

This field is not needed anymore since we're using Guardian for permission management.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `953362545ef7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.