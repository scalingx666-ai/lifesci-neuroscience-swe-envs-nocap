# Issue

**Title:** perf: rapid organelle hole filling for meshes and skeletons

## Description

This update resolves the extremely long hole filling times it would take for cross section analysis. This uses the new fill_holes_v2 and kimimaro multipass.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `029e041dadf2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.