# Issue

**Title:** Fix Docker and add v0.12 release notes

## Description

Install from sdist in Dockerfile.

Update Matplotlib API in notebook example used to showcase Docker at brainiak.org.

Fix Docker instructions in README.

Include test data in sdist.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `69d7158a0cf4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.