# Issue

**Title:** MNT: Apply Repo-Review suggestions

## Description

## Changes proposed in this pull request

Illustrates discussion https://github.com/orgs/nipreps/discussions/46.

Apply some [Repo-Review](https://learn.scientific-python.org/development/guides/repo-review/?repo=nipreps%2Ffmriprep&branch=master) suggestions.

I went for the low-hanging fruits, other changes are more invasive and deserve a PR of their own (for example switching flake8/black/isort to ruff in #3185).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6572d1ed92a3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.