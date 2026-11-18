# Issue

**Title:** Fix 'show_if' not evaluated for sketchpad items

## Description

e.is_shown is a function, not a property and must be called.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `23b63eb68a3c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.