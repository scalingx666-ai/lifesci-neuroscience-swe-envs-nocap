# Issue

**Title:** Dockerfile cleanup

## Description

#630 research
- npm is not needed for nginx (5f661537)
- apt-get update was already run
- [WORKDIR](https://docs.docker.com/v17.09/engine/reference/builder/#workdir) creates its dirs automatically

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `108500c44afd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.