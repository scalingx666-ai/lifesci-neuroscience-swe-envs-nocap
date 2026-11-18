# Issue

**Title:** net.run fix for unconnected layers

## Description

Zero tensor needs to be on same device as target layer.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0726d4cb873e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.