# Issue

**Title:** chore: Resolve CI failures

## Description

* setuptools has started pulling non-public APIs from `distutils`, breaking the `py39-min` tests. The simplest solution is to require `numpy >=1.23`, which deprecated `numpy.distutils` and removed it from any import tree we use.
* Ruff has started auto-fixing return types that could be `Self`. I would like to remove the `typing_extensions` dependency, but this does not introduce it.
* Either mypy or numpy made some modification that requires us to better type something that expects an integer type or an integer dtype. Easy enough.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `84294f4e05e0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.