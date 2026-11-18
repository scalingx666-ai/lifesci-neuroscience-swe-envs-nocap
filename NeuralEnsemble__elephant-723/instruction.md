# Issue

**Title:** Drop support for Python 3.9

## Description

# Desc
Python 3.9 reached end-of-life in October 2025. This PR drops it from the supported versions; Elephant now requires Python >= 3.10.

# Changes
- **`pyproject.toml`**: `requires-python` raised to `>=3.10`; removed the 3.9 classifier.
- **`.github/workflows/CI.yml`**: removed 3.9 from `FULL_MATRIX`.
- **`.github/workflows/build_wheels.yml`**: added `cp39-*` to `CIBW_SKIP` to skip build
- **`requirements/environment.yml`, `requirements/environment-tests.yml`**: `python>=3.10`.
- **`doc/install.rst`**: supported versions updated to 3.10–3.14 (this also adds 3.14, which was missing).

# ToDo
- [x] In conversion.py:709, there is a TODO (from #653 ) to raise scipy from >=1.10.0 to scipy>=1.15.0 once pytohn 3.9 is dropped.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4315e06ec186`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.