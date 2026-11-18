# Issue

**Title:** Mark tests that are expected to fail with `xfail` rather than just not running them

## Description

At least this way we will know whether or not they are passing.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f1e37859eb41`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.