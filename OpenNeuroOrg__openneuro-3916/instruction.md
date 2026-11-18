# Issue

**Title:** refactor(graphql): Drop unused dataset history fields

## Description

These fields are computationally expensive and would lead to timeouts loading the history API. We should provide diff status separately instead of calculating the diff for ever commit.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b8eaca6d40d0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.