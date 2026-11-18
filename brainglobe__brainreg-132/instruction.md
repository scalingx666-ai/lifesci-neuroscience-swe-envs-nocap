# Issue

**Title:** Update CI to build with NI-unit actions

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

Updates the CI to use the NI-unit actions, which in turn fixes the auto-deployment failures (which were caused by references to `setup.py` which no longer exists).

Also adds a MANIFEST.in check, so we don't bloat the source distribution.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fd6475f90e2c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.