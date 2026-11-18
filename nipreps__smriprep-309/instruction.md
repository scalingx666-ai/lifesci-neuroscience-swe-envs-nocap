# Issue

**Title:** WRAPPER: Update patch location, use --patch syntax

## Description

Needed to debug #303

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d35824d75ea8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.