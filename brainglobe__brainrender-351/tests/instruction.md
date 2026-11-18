# Issue

**Title:** Add screenshot tests

## Description

I've raised this PR to investigate #338. The test suggest that there is a problem specifically with Linux. Images are generated, but it's not what it's meant to be.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `48f655f4b636`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.