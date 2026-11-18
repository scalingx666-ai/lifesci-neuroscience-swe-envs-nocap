# Issue

**Title:** Bugfix/sinkhorn sparse solver

## Description

This PR bugfixes our sparse sinkhorn solver (which I hadn't really tried until a few days ago) and speeds it up using more elegant matrix @ vector products to perform basic tensor operations.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8775aac5b7c0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.