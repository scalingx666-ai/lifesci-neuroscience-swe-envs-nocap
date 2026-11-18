# Issue

**Title:** fix(server): Snapshot worker response type fixes

## Description

This separates the SnapshotDocument and SnapshotResponse types to match the MongoDB representation and the response from the worker API correctly. Previously these were often conflated but usually equivalent.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1525b3aac3c3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.