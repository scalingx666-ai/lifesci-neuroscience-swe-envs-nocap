# Issue

**Title:** ci: add PyGrep hooks

## Description

Address this Scientific Python Development Guide [Repo-Review](https://learn.scientific-python.org/development/guides/repo-review/?repo=nipreps%2Fmriqc&ref=HEAD&refType=branch&show=all) suggestion:
> #### [PC170](https://learn.scientific-python.org/development/guides/style#PC170): Uses PyGrep hooks (only needed if rST present)
> Must have `https://github.com/pre-commit/pygrep-hooks in .pre-commit-config.yaml`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a30969db121d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.