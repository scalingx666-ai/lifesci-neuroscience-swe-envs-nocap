# Issue

**Title:** Remove test dependency duplication

## Description

We shouldn't need to define test dependencies in tox. This PR relies on installing the `dev` and `napari` extras, so hopefully we have one less thing to keep up to date.

Closes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4ebbd46509c0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.