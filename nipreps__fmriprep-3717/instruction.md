# Issue

**Title:** ci: add zizmor GitHub Action for security auditing

## Description

## Changes proposed in this pull request

Address this Scientific Python Development Guide [Repo-Review](https://learn.scientific-python.org/development/guides/repo-review/?repo=nipreps%2Ffmriprep&ref=HEAD&refType=branch&show=all) suggestion:
> Projects with GitHub Actions should statically analyze their workflows with [zizmor](https://docs.zizmor.sh/), which catches common security issues such as template injection, excessive permissions, and credential persistence.

## Documentation that should be reviewed

* https://docs.zizmor.sh/

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ed2cfb61d1f5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.