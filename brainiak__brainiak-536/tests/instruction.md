# Issue

**Title:** Trigger release on push of tag

## Description

- Add trigger for release when pushing tags that start with 'v'
- Made release job depend on passing of tests for pypi and conda.

,

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a32105974f8a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.