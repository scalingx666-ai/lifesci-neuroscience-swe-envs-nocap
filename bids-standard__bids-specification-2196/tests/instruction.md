# Issue

**Title:** [INFRA] Remove changelog generator CI workflow

## Description

This hasn't been working for a while. The new method is:

```console
$ export GITHUB_TOKEN=...  # You need a GitHub token with permissions to read public repos
$ uv run tools/make_changelog.py
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8fd451a90f9d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.