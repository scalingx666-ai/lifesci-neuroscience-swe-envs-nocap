# Issue

**Title:** Singularity and CICD Fix

## Description

- Update singularity commands to build container locally based on docker image
- Add dev branch CICD workflows
    - Dev branch will push dev docker image and build a singularity image (without pushing it)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `543fb1490875`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.