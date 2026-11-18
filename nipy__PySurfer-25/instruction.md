# Issue

**Title:** ENH: TimeViewer for multiple Brain

## Description

Allow TimeViewer to control multiple Brain objects. Also fixed a bug in Brain.__view() (was setting view for the wrong figure when multiple figures were open).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4627217f2990`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.