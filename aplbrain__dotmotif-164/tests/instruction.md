# Issue

**Title:** Finish uv packaging migration

## Description

This finishes the move to uv and gets the packaging metadata back to one source of truth.

- makes `pyproject.toml` and `uv.lock` authoritative
- moves Neo4j and NeuPrint support into optional extras
- derives build metadata from the package version
- switches CI to `setup-uv`, locked environments, and `uv run`
- builds and smoke-checks the wheel in CI
- stops shipping the test suite in distributions
- removes the old setuptools, requirements, and manifest files

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ec8eea1db7a8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.