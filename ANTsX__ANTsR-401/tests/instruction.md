# Issue

**Title:** FIX: move ANTsRCore to Imports

## Description

Previously, ANTsRCore was in Depend which means it was attached when ANTsR was loaded. This means functions with the same name in ANTsRCore will be available when they shouldn't be. This fixes that issue by only importing ANTsRCore.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7f76349c6f3e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.