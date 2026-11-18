# Issue

**Title:** fix(worker): Fix incorrect bucket name for backup bucket deletions

## Description

Deletion would fail for the backup bucket by paginating on the wrong bucket name.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6d397dcd6ca3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.