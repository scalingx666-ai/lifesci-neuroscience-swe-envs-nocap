# Issue

**Title:** -- Update DataTree submodule reference to latest change containing fi…

## Description

-- Update DataTree submodule reference to latest change containing fix for errors when there are no data files (because all have errors that prevent loading)

-- Fix more issues with install executable "setup.command" on MAC

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aed87aaaf844`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.