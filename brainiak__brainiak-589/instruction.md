# Issue

**Title:** Use uv in cd workflow

## Description

## Summary

Update the CD workflow to match the uv-based CI setup.

Changes:
- Install uv with `astral-sh/setup-uv@v7` in the sdist, wheel, and conda jobs.
- Build the sdist with `uv build --sdist` instead of `pipx run build`.
- Run cibuildwheel through `uvx cibuildwheel` instead of installing it with pip.
- Resolve the package version with `uvx --from setuptools-scm python -m setuptools_scm`.
- Drop Python 3.9 from the conda build matrix because `pyproject.toml` now requires Python >=3.10.
- GitHub has deprecated the macos-13 runner image and the jobs are now sitting queued. Replace the Intel macOS entries in the wheel and conda CD matrices with macos-15-intel while keeping macos-14/macos-latest for Apple Silicon coverage

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `66e71dd25efd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.