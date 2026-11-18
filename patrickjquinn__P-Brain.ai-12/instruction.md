# Issue

**Title:** Dockerfile fixed

## Description

We try to copy package.json to the /home/ folder as the file with name 'app'. Therefore we can't create a new directory /home/app

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5b3fa79a4769`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.