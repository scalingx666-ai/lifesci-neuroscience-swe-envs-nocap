# Issue

**Title:** Fix schema.org

## Description

It turns out keys in JSON cannot repeat and identifiers should be a list.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4f8a8db146ac`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.