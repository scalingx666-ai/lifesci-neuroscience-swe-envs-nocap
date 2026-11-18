# Issue

**Title:** COMP: Add missing include headers

## Description

This happens when these files are used directly,
and not through default ANTs build system.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dcdc878db513`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.