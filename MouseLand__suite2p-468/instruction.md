# Issue

**Title:** Remove run_s2p dependency on ops1 for running

## Description

refactored run_s2p so that `run_plane(ops)` is the standalone function for running on folders of `planeX` data

makes it easier to parallelize suite2p processing across planes on a computing cluster

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2e1114d0d5f3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.