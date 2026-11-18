# Issue

**Title:** Add mypy and types-PyYAML to dev dependencies

## Description

Allows running mypy locally without --install-types, which requires pip and fails in uv-managed venvs.

Prior attempt to release did not work since push of master failed due to protections, I pruned the tag commit, disabled master protection -- we will try release again if all green.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0866fe5fbe0e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.