# Issue

**Title:** [MNT] Update pyproject.toml

## Description

Updating `pyproject.toml` so that `docs` and `examples` folders will not appear in the top-level of `site-packages`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a89b6990d6a5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.