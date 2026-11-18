# Issue

**Title:** MAINT: Use openneuro-py main

## Description

We might as well use `openneuro-py` main given the overlap between maintainers. It should help us catch bugs before release.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cf29390e407b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.