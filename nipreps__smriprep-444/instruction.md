# Issue

**Title:** chore: Clean up doc builds, environment, style checks

## Description

This is a potpourri of little things that need doing, easiest to review one commit at a time, as one of them was a `ruff check --fix && ruff format` run.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6501da1c54e1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.