# Issue

**Title:** fix(schema): Check SpatialReference for space, template entities

## Description

The rule changes in #1714 were a bit off. If the `space-<label>` entity is set, then the file is in that space, regardless of whether the file is `tpl-<label>-*` or `sub-<label>-*`, so check for a spatial reference if that value is unknown.

If space is not absent, *then* we check for whether `tpl-<label>` is defined and unknown.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7c5cc3c6b43c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.