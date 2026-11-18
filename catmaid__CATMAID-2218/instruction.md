# Issue

**Title:** Docker updates, with CI build

## Description

- Use py39 for docker
- Remove virtualenvwrapper references
- GitHub Actions to make sure the docker image builds
- Remove `--upgrade-deps` from docs

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ba5d67b4cc0e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.