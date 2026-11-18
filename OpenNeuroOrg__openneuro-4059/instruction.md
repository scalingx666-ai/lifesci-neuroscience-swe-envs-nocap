# Issue

**Title:** fix(app): Use filename and path to identify deleted file apollo cache updates

## Description

This fixes deletes appearing to not work on the client side. Reading by field instead of cache id matches correctly on the client side cache after the delete mutation succeed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ead8d9394570`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.