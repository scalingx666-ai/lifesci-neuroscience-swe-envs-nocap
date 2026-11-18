# Issue

**Title:** feat: transfer unsharded meshes to sharded meshes

## Description

- Adds mesh transfer command `igneous mesh xfer $SRC $DST [--sharded] [--magnitude 2] --queue queue`
- Supports
    - Unsharded -> Unsharded
    - Sharded -> Sharded
    - Unsharded -> Sharded
    - NOT Sharded -> Unsharded (open a request)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d482cfbb4b90`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.