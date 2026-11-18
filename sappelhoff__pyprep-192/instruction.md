# Issue

**Title:** Add Python 3.14 support, bump tooling, fix a spurious warning

## Description

Routine maintenance:

- Add Python 3.14 to the classifiers; bump the tested/built version 3.13 → 3.14 (tests, build, release, RTD).
- `pre-commit autoupdate`: ruff v0.15.2 → v0.15.17, toml-sort v0.24.3 → v0.24.4.
- Fix two RST docstring warnings in `find_bad_by_PSD`.
- Stop `Reference` emitting a spurious "No bad channels to interpolate" warning when there is nothing to interpolate.

`pre-commit`, `sphinx-build` (0 warnings), and `pytest -W error` (47 passed) are all clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a80b37142883`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.