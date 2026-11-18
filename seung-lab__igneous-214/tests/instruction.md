# Issue

**Title:** perf(multires meshes): vastly faster mesh chunking

## Description

Uses new `zmesh.chunk_mesh` in zmesh==1.9.0 to accelerate mesh chunking

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `82a7a803c036`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.