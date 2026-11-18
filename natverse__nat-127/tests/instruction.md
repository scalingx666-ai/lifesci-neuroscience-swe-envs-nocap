# Issue

**Title:** Fix read.hxsurf to order vertices such that surface normals always point outwards

## Description

This is useful for #95.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `accba8ba0d19`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.