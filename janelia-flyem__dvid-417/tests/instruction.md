# Issue

**Title:** Export shards

## Description

Belated integration of "export shard" feature that allows saving labelmap instances using Arrow IPC files for later zero-copy processing like conversion to neuroglancer precomputed or loading into VastDB. @stuarteberg

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f1ca968e64d2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.