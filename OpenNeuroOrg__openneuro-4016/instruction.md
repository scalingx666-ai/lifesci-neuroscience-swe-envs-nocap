# Issue

**Title:** fix(app): Remove stale @openneuro/client dependency

## Description

This removes the last reference to the @openneuro/client package which was still being used in the indexer for a few functions despite being long deprecated.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2eac5edd05f8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.