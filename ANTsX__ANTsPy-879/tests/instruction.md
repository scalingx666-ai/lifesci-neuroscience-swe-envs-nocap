# Issue

**Title:** BUG: Remove deprecated numpy calls to reshape

## Description

Also one instance of deprecated coercion from array to scalar.

This should prevent the recent test failures that started from the release of numpy 2.4.0.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ae18d447f2ec`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.