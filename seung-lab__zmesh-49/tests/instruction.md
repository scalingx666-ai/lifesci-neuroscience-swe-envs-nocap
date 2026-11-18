# Issue

**Title:** feat: add face based CCL

## Description

Face based CCL, where faces are linked by shared edges rather than shared vertices, are more robust for producing manifold results. A non-manifold vertex can be shared by two shapes at a pinch.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2c9bf18b4c15`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.