# Issue

**Title:** Use our fork of coding conventions

## Description

.

Replace `pkg_resources` by `importlib` and `packaging`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `69173b9ab9e3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.