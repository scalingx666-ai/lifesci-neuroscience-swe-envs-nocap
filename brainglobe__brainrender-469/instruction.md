# Issue

**Title:** ci: migrate from tox to uv test action

## Description

Migrate CI from `neuroinformatics-unit/actions/test@v2` (tox) to `neuroinformatics-unit/actions/test-uv@main` (pure uv).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `50903ef40e46`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.