# Issue

**Title:** `Volume` subclass `BrainStructure`

## Description

During refactoring from v0.4axx to v1.0axx, it was decided to make `Volume` a `Location` which is a `BrainStructure`. However, while a `Volume` instance can convey a kind of location in space, it does not possess the aspects of a `Location` as siibra-python defines it. Therefore, it is updated as a `BrainStructure`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `14aed67a27df`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.