# Issue

**Title:** ci: update zizmor pre-commit hook

## Description

The repository has been moved to a dedicated organisation in GitHub. Update the URL.

Addresses this Scientific Python Development Guide [Repo-Review](https://learn.scientific-python.org/development/guides/repo-review/?repo=nipreps%2Fsmriprep&ref=HEAD&refType=branch&show=all) suggestion:
> Projects with GitHub Actions should statically analyze their workflows with [zizmor](https://docs.zizmor.sh/), which catches common security issues such as template injection, excessive permissions, and credential persistence.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9d65419ca432`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.