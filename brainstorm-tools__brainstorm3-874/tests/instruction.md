# Issue

**Title:** Fix mesh merging for single-surface FEM mesh generation

## Description

Update process_fem_mesh.m to skip mesh merging when only one BEM surface is present. This prevents errors and unnecessary prompts for merge methods when generating FEM meshes from a single surface.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `99a1cc42674a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.