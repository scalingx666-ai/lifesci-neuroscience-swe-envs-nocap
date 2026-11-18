# Issue

**Title:** ENH: finish `replace` method and write tests for nobrainer.volume

## Description

`nobrainer.volume.replace` can now be used for multi-class segmentation. the function is implemented in pure tensorflow, so it can be XLA compiled and serialized in a graph.

this PR also removes the function `nobrainer.volume.apply_random_transform_dataset` — turns out it was never used...

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f595d6e3cf05`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.