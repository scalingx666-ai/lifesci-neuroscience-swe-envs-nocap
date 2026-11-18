# Issue

**Title:** Update tooling config

## Description

- Remove references to py38
- Remove cibuildwheel config (unnecessary since the move to numba from Cython)
- Move tox config to pyproject.toml to reduce number of config files and harmonise with the rest of BrainGlobe

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aff194b5ac39`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.