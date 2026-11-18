# Issue

**Title:** [MAR-2520] Validate API inputs before repository I/O

## Description

## Human summary

Invalid JavaScript API calls now fail before Encephalon discovers a repository, opens SQLite, writes instructions, or mutates records.

## Summary

- Add central runtime parsers for root, cache, gather, init, and add-record inputs.
- Validate booleans, limits, ids, kinds, subjects, queries, and gather arrays before repository/cache I/O.
- Reuse canonical record validation for add-record inputs before operation-lock acquisition.
- Preserve existing blank-query behaviour while rejecting non-string queries and invalid array members.
- Add regression coverage proving invalid calls return `INVALID_ARGUMENT` without creating cache or instruction files.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d515c58d8dab`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.