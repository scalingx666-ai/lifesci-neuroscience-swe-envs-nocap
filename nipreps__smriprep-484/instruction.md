# Issue

**Title:** chore: ISC rules do not conflict with the formatter any more

## Description

https://astral.sh/blog/ruff-v0.9.0#fewer-single-line-implicitly-concatenated-strings

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7ab5bbdfb73e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.