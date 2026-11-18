# Issue

**Title:** Remove duplicated check-manifest step

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
This PR  

**What does this PR do?**
This PR removes the manifest job from test_and_deploy.yml, keeping the one in pre-commit-config.yaml, so that we can get fast feedback locally, and pre-commit.ci will also run this check remotely. This keeps the CI steps simple.

## Checklist:

- [ ] The code has been tested locally
- [ ] Tests have been added to cover all new functionality
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `93ebf884351a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.