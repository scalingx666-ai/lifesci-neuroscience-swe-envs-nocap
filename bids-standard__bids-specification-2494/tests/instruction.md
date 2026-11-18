# Issue

**Title:** chore: Run ruff through pre-commit, avoiding drift

## Description

The [Validation](https://github.com/bids-standard/bids-specification/actions/workflows/validation.yml) workflow is failing because ruff is trying to reformat things. This results from using `uvx ruff` instead of a pinned version. The simplest way to handle this is to pin in one place (pre-commit). Failures will still show up in CI, and failures related to changes in ruff will appear only in version update PRs.

@Remi-Gau Could I bother you for a review of this one?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bb1df92a4183`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.