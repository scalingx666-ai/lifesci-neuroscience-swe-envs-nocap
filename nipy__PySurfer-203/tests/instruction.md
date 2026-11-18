# Issue

**Title:** Colormap as list tweaks

## Description

- Allow color-lists with colors including alpha
- Allow specifying color-lists as tuples (which was possible previously, so since tuples are often used interchangeably with lists I am not sure whether you removed this intentionally)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `153e7353015b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.