# Issue

**Title:** fix(build): read version statically from brainpy._version

## Description

## Why

PR #865 moved `__version__` / `__version_info__` into `brainpy/_version.py` and made `brainpy/__init__.py` re-export them. Two consumers still pointed at the old location in `__init__`, which regressed **static** version resolution.

## Changes

- **`pyproject.toml`** — `version = { attr = "brainpy.__version__" }` → `{ attr = "brainpy._version.__version__" }`.
  setuptools reads `attr` via AST only when the target is a literal assignment. After the move, `__init__` exposes `__version__` through an `ImportFrom`, so setuptools falls back to **importing the whole `brainpy` package**. `Publish.yml` runs `python -m build` in an isolated env with only the build backend (no jax/brainstate), where that import raises `ModuleNotFoundError` — the PyPI build would fail. Reading from `brainpy._version` (a literal `__version__`) resolves statically, no import.
- **`docs/conf.py`** — replace `import brainpy` + `release = brainpy.__version__` with `from brainpy._version import __version__ as release`. `brainpy` was not used elsewhere in `conf.py`.

## Proof

`StaticModule` (setuptools' import-free AST reader) on:
- `brainpy/__init__.py` → `AttributeError` (would fall back to importing the package)
- `brainpy/_version.py` → `'2.8.0'` (static)

## Unchanged

- `brainpy/__init__.py` keeps re-exporting, so `bp.__version__` still works for users.
- `_version.py` ships automatically via `[tool.setuptools.packages.find]`; no package-data/MANIFEST change.
- No workflow files reference a literal version.

## Summary by Sourcery

Read the project version directly from the internal _version module to restore static version resolution in builds and docs.

Build:
- Update setuptools dynamic version configuration to reference brainpy._version.__version__ instead of the re-export in brainpy.__init__ for import-free builds.

Documentation:
- Adjust Sphinx configuration to obtain the release version from brainpy._version.__version__ without importing the full brainpy package.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ca1d233d35fd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.