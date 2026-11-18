# Issue

**Title:** COMP: Declare scipy, remove unused dependencies

## Description

This makes the dependency lists match what `ants` imports: it declares scipy and removes pyyaml, webcolors and Pillow from `pyproject.toml`, `requirements.txt` and `environment.yml`.

`ants.math.quantile` and `ants.learn.decomposition` import scipy at module level. scipy was declared only to bound it below 1.16 (#825), and #900 removed the entry along with the bound, so scipy now arrives only through scikit-learn and statsmodels. This declares it again, without a bound.

Nothing in `ants` imports pyyaml or webcolors, and nothing imports Pillow directly. matplotlib still requires Pillow, so Pillow is still installed.

I tested this by installing the cp314 wheel with `--no-deps` into a clean Python 3.14 environment and adding only the new dependency list. pyyaml and webcolors were absent, and the full test suite passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `78a26a1e2d59`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.