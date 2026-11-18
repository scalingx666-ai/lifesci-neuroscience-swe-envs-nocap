# Issue

**Title:** Remove `load_from_folder` from base

## Description

`load` already handles this and `load_from_folder` is just barely wrapping `load` anyway. We could consider deprecating for a version, but since `load` is there I think any complaints form people are very easily addressed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7d81d6357b2e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.