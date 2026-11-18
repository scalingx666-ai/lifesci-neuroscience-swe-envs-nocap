# Issue

**Title:** chore(ci): Update build step, enable pre-release tests

## Description

Following advice in  trying out v2.8.

Also enabling pre-release tests. Hopefully this isn't a rabbit hole.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9a6385b5b2ff`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.