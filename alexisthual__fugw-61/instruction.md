# Issue

**Title:** Fix/57 barycenter different geometries

## Description

Sparse barycenters now only rely on a common `geometry_embedding` which  .

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ce9e5f17c12c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.