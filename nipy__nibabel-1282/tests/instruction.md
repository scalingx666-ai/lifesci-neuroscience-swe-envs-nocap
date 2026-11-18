# Issue

**Title:** CI: FORCE_COLOR for readable tox/pytest outputs, use OIDC PyPI uploads

## Description

Two small cleanups for the CI run. One is to enable colored tox output for improved readability.

The other is to enable [trusted publishing](https://docs.pypi.org/trusted-publishers/) so that releases from this repository can be uploaded without relying on a maintainer having an active token scoped to the project in the repo secrets. We have a "Package deployment" environment that waits on a maintainer to approve upload.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `07289b7c9f29`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.