# Issue

**Title:** Update manual version

## Description

Apologies for the PR noise.

New version in setup.py for patched version, so we can release `v0.7.0` to PyPI.

There look to be old tags (v0.6.0) that are datestamped 2020, but the latest releases are from 2021 and only reach v0.4.21.

Bumping to version `v0.7.0` to skip around this ambiguity. Will generate release notes once pushed to PyPI.

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2f468f39437d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.