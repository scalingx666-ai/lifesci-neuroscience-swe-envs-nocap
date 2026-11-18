# Issue

**Title:** Add lazy dask atlas loading

## Description

.

## Summary
- add `dask=True` to `BrainGlobeAtlas`/core `Atlas`
- when `dask=True`, return dask arrays for template, annotation, hemispheres, and structure masks
- make `Atlas`/`BrainGlobeAtlas` generic over array types for proper hints in IDEs and with static type checkers
- keep coordinate lookup methods returning scalar values

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6b1c92cf7395`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.