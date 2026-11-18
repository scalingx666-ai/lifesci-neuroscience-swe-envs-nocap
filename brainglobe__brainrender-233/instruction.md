# Issue

**Title:** [pre-commit.ci] pre-commit autoupdate

## Description

<!--pre-commit.ci start-->
updates:
- https://github.com/ambv/black → https://github.com/psf/black
- [github.com/psf/black: stable → 23.3.0](https://github.com/psf/black/compare/stable...23.3.0)
- https://gitlab.com/pycqa/flake8 → https://github.com/PyCQA/flake8
- [github.com/PyCQA/flake8: 3.9.2 → 6.0.0](https://github.com/PyCQA/flake8/compare/3.9.2...6.0.0)
<!--pre-commit.ci end-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a5ab30fbdeed`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.