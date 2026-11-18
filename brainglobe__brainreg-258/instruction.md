# Issue

**Title:** [pre-commit.ci] pre-commit autoupdate

## Description

<!--pre-commit.ci start-->
updates:
- [github.com/astral-sh/ruff-pre-commit: v0.12.11 → v0.13.3](https://github.com/astral-sh/ruff-pre-commit/compare/v0.12.11...v0.13.3)
- https://github.com/psf/black → https://github.com/psf/black-pre-commit-mirror
- [github.com/psf/black-pre-commit-mirror: 25.1.0 → 25.9.0](https://github.com/psf/black-pre-commit-mirror/compare/25.1.0...25.9.0)
- [github.com/pre-commit/mirrors-mypy: v1.17.1 → v1.18.2](https://github.com/pre-commit/mirrors-mypy/compare/v1.17.1...v1.18.2)
<!--pre-commit.ci end-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b54659a9e403`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.