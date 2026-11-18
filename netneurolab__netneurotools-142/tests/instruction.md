# Issue

**Title:** [MNT] Update pyproject.toml

## Description

Addressing #141, updating `pyproject.toml` so that `docs`, `examples` and `resources` folders will not appear in the top-level of `site-packages`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `117af2174cee`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.