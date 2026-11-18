# Issue

**Title:** refactor: move __version__ and __version_info__ into _version.py

## Description

Extract the version definitions from `brainpy/__init__.py` into a dedicated `brainpy/_version.py` module and re-export them from the package root.

- `brainpy._version` is now the single source of truth for the version string.
- `brainpy/__init__.py` re-exports `__version__` and `__version_info__`, so `pyproject`'s `version = { attr = "brainpy.__version__" }` still resolves.
- `_version.py` is already listed in the coverage omit lists in `pyproject.toml`.

Verified `import brainpy` yields `2.8.0` / `(2, 8, 0)`.

## Summary by Sourcery

Enhancements:
- Introduce brainpy._version as the single source of truth for __version__ and __version_info__ and re-export these attributes from brainpy.__init__.py.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8c589751d866`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.