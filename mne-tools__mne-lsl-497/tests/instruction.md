# Issue

**Title:** Ugprade liblsl to 1.17.4

## Description

To run our CIs with the latest version, including maybe some fix that will benefit our CI stability. We should then wait for a new release and pin to the latest stable release.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `47817510077f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.