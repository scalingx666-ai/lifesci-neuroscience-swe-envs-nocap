# Issue

**Title:** Update GitHub Actions and docs dependencies

## Description

This pull request updates the GitHub Actions workflows to use the latest versions of several actions across the Docker release, documentation, and testing pipelines. The main goal is to ensure compatibility, security, and access to the latest features and bug fixes by upgrading all actions to their newest major versions.

**CI/CD Workflow Upgrades:**

* Updated all uses of `actions/checkout` from v4 to v7 in `.github/workflows/docker-release.yml`, `.github/workflows/docs.yml`, and `.github/workflows/tests.yml` to ensure the latest features and security updates are applied. [[1]](diffhunk://#diff-155353073f96bc01f2db838a9b2a2112568bac7ea32a4b4797c5dbc21c6fca42L18-R42) [[2]](diffhunk://#diff-9cf2000c53760d837a449f874e53f792819108d3a4bf346336d0f7d082deae2cL19-R23) [[3]](diffhunk://#diff-1db27d93186e46d3b441ece35801b244db8ee144ff1405ca27a163bfe878957fL14-R18) [[4]](diffhunk://#diff-1db27d93186e46d3b441ece35801b244db8ee144ff1405ca27a163bfe878957fL30-R30) [[5]](diffhunk://#diff-1db27d93186e46d3b441ece35801b244db8ee144ff1405ca27a163bfe878957fL44-R48)
* Upgraded `actions/setup-python` from v5 to v7 in `.github/workflows/docs.yml` and `.github/workflows/tests.yml` for improved Python environment setup. [[1]](diffhunk://#diff-9cf2000c53760d837a449f874e53f792819108d3a4bf346336d0f7d082deae2cL19-R23) [[2]](diffhunk://#diff-1db27d93186e46d3b441ece35801b244db8ee144ff1405ca27a163bfe878957fL14-R18) [[3]](diffhunk://#diff-1db27d93186e46d3b441ece35801b244db8ee144ff1405ca27a163bfe878957fL44-R48)
* Updated Docker-related actions in `.github/workflows/docker-release.yml`:
  - `docker/login-action` from v3 to v4,
  - `docker/metadata-action` from v5 to v6,
  - `docker/build-push-action` from v6 to v7,
  ensuring the Docker build and push processes use the latest stable actions.
* Upgraded documentation deployment actions in `.github/workflows/docs.yml`:
  - `actions/upload-pages-artifact` from v3 to v5,
  - `actions/deploy-pages` from v4 to v5,
  to leverage improvements and bug fixes for GitHub Pages deployments.
* Updated `actions/upload-artifact` from v4 to v7 in `.github/workflows/tests.yml` for test result uploads, improving artifact handling and reliability.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ffcc2e0f6579`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.