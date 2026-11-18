# Issue

**Title:** Sortingview/Figpack: transpose templates (for `sortingview`) and cast to `float32` to avoid serialization issues

## Description

Fixes a backward compatibility issue with `sortingview`. In refactoring to figpack, we removed the float32 cast and the transopose.

Adding back both (transpose only if sortingview backend)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bfd398aac464`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.