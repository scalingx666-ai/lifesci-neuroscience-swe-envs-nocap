# Issue

**Title:** chore: Use tox-uv and uv.lock to test minimum, locked, and pre-release dependencies

## Description

My goal is to remove dependency caps, which lead to very fragile environment resolutions. I understand that the purpose of these caps is to ensure that regressions can be localized to changes in specific dependencies, so this PR uses uv lockfiles to address that.

`uv lock [--upgrade]` inspects PyPI and finds the latest versions of tools that successfully satisfy the environment described by `pyproject.toml`, including optional dependencies. You can checkout the repository and get the same environment as anybody else with `uv sync`.

This PR also uses `tox-uv` to create environments `py<ver>-{min,latest,pre}`. `py*-min` attempts to install the minimum versions that are declared in `pyproject.toml` into an environment that created with the declared Python version. `py*-latest` will use `uv sync` to setup the environment, while `py*-pre` will look for pre-release versions of dependencies, so that you can catch breakages coming down the line.

It also sets the dependabot environment to `uv`, to auto-update your `uv.lock` file, and sets up a GitHub action to run tox, as a demonstration. If this looks like a good approach, I'll figure out how to replace your conda environments in CircleCI with `uv sync`-based ones.

Addresses #1185.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b7622fa6dfa5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.