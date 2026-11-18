# Issue

**Title:** evolution: handling of seed = None for pypet

## Description

`pypet` doesn't like to add `None` results. The RNG seed parameter `model.params["seed"]` is usually `None` and was set to `0` to avoid issues before. Now it stays `None` but when saving to `pypet`, the case is handled.

The rest of the other changes are only black formatting...

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a166886b8256`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.