# Issue

**Title:** HBP-219. Migrate code to SQLAlchemy > 2.0

## Description

While migrating few new warnings from SQLAlchemy appeared, regarding aliases. Those are fixed also by this PR

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `47ec23ccc4c6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.