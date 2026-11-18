# Issue

**Title:** Fix seeded randomization.

## Description

Avoid removing entries from people's dictionaries.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `95b2b568b124`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.