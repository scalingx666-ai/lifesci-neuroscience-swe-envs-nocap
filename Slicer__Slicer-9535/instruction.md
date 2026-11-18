# Issue

**Title:** BUG: Fix slice view intersection of volumetric meshes

## Description

The cells near the slice were converted to a surface before cutting. Cutting only the faces of a volumetric mesh gives the outline of the cross-section instead of the filled cross-section. Only surface models are converted to a surface now.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `feb57a512b51`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.