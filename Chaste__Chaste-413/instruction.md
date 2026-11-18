# Issue

**Title:** Quick fix for errant --oversubscribe

## Description

If present, remove it.

This is a quick fix to get things working immediately, and should be superseded by resolving #410

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `abf76526f8c4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.