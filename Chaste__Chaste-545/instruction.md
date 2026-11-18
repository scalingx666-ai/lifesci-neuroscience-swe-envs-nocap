# Issue

**Title:** Distribute multiarch docker builds

## Description

Supports #544 

**Changes**

- Switches to the `docker/github-builder/.github/workflows/build.yml@v1` action for building multiarch images on github-hosted runners.
- Adds a `workflow_dispatch` trigger for future testing.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9ddcab9f04c7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.