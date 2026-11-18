# Issue

**Title:** ci: add zizmor pre-commit hook for security auditing

## Description

Address this Scientific Python Development Guide [Repo-Review](https://learn.scientific-python.org/development/guides/repo-review/?repo=nipy%2Fnibabel&ref=HEAD&refType=branch&show=all) suggestion:
> #### [SEC001](https://learn.scientific-python.org/development/guides/security#SEC001): Use zizmor to check the GitHub Actions
> Projects with GitHub Actions should statically analyze their workflows with [zizmor](https://docs.zizmor.sh/), which catches common security issues such as template injection, excessive permissions, and credential persistence.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b84ca6ba8949`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.