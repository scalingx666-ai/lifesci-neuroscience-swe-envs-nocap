# Issue

**Title:** FIX: LTS package build

## Description

Bitrot inevitably sets in. This should resolve the current failures by using modern build tools.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d90f6522da5b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.