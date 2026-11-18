# Issue

**Title:** [ci] Add ci support for python 3.12

## Description

This pull request includes updates to the CI configuration files to add support for Python 3.12. The changes are made across multiple sections in two files: `.github/workflows/CI-models.yml` and `.github/workflows/CI.yml`.

Updates to CI configuration:

* [`.github/workflows/CI-models.yml`](diffhunk://#diff-92c106692b8ac80629dc2acd22fdc0ac5f445000eb97458e2b88b85b0a342833L25-R25): Added Python 3.12 to the `python-version` matrix in three different job strategies. [[1]](diffhunk://#diff-92c106692b8ac80629dc2acd22fdc0ac5f445000eb97458e2b88b85b0a342833L25-R25) [[2]](diffhunk://#diff-92c106692b8ac80629dc2acd22fdc0ac5f445000eb97458e2b88b85b0a342833L73-R73) [[3]](diffhunk://#diff-92c106692b8ac80629dc2acd22fdc0ac5f445000eb97458e2b88b85b0a342833L122-R122)
* [`.github/workflows/CI.yml`](diffhunk://#diff-3ab46ee209a127470fce3c2cf106b1a1dbadbb929a4b5b13656a4bc4ce19c0b8L31-R31): Added Python 3.12 to the `python-version` matrix in three different job strategies. [[1]](diffhunk://#diff-3ab46ee209a127470fce3c2cf106b1a1dbadbb929a4b5b13656a4bc4ce19c0b8L31-R31) [[2]](diffhunk://#diff-3ab46ee209a127470fce3c2cf106b1a1dbadbb929a4b5b13656a4bc4ce19c0b8L62-R62) [[3]](diffhunk://#diff-3ab46ee209a127470fce3c2cf106b1a1dbadbb929a4b5b13656a4bc4ce19c0b8L95-R95)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a354bf24ddd0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.