# Issue

**Title:** Fix failing tests

## Description

This PR aims to resolve the issues raised in #4 by introducing a minor change to how NumPy data types are handled during JSON serialization.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ec1b0852a120`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.