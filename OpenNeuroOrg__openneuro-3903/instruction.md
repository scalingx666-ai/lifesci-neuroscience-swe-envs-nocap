# Issue

**Title:** refactor(server): Resolve refs for getFiles to prevent cache pollution/duplication

## Description

This solves an issue where the unresolved references such as HEAD or `1.0.0` would pollute or duplicate cache entries for getFiles. .

In general it would be cleaner to move towards resolving these to git hashes at the resolver level and only handling actual hashes in the rest of the implementation. Only addressing getFiles here though.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `95f239b3e919`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.