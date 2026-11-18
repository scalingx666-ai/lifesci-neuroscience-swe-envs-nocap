# Issue

**Title:** ci: show ruff fixes

## Description

Address this Scientific Python Development Guide [Repo-Review](https://learn.scientific-python.org/development/guides/repo-review/?repo=nipy%2Fnibabel&ref=HEAD&refType=branch&show=all) suggestion:
> #### [PC191](https://learn.scientific-python.org/development/guides/style#PC191): Ruff show fixes if fixes enabled
> If `--fix` is present, `--show-fixes` must be too.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b84ca6ba8949`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.