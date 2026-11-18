# Issue

**Title:** Update `imio` dependency

## Description

As per 

`imio` is merging with `brainglobe-utils` version 0.4.0, so we should drop our `imio` dependency and instead use the version that comes with `brainglobe-utils`.

CI will fail until `brainglobe-utils v0.4.0` is available on PyPI.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `89101e73a30d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.