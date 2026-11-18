# Issue

**Title:** MNT: apply Repo-Review suggestions

## Description

Apply some [Repo-Review](https://learn.scientific-python.org/development/guides/repo-review/?repo=nipy%2Fnipy&branch=main) suggestions.

I went for the low-hanging fruits, other changes are more invasive and deserve a PR of their own, such as using a formatter like ruff of black.

### Fixed issues

* [PC190](https://learn.scientific-python.org/development/guides/style#PC190): Uses Ruff
  Use `https://github.com/astral-sh/ruff-pre-commit` instead of `https://github.com/charliermarsh/ruff-pre-commit` in `.pre-commit-config.yaml`
* RF202: Use (new) lint config section
  `select` should be set as `lint.select` instead
* VPP001: Validate pyproject.toml
  Invalid pyproject.toml! Error: `project` must not contain {'python-requires'} properties

Also, update ruff to a decently recent version.

### Issues ignored

I have left this issue for a later PR, as it requires extensive changes:
* [RF101](https://learn.scientific-python.org/development/guides/style#RF101): Bugbear must be selected
  Must select the flake8-bugbear B checks. Recommended:
  ```toml
  [tool.ruff.lint]
  extend-select = [
    "B",  # flake8-bugbear
  ]
  ```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fa2f7af6e7d0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.