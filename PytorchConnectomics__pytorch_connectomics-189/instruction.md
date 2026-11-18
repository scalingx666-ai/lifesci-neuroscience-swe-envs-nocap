# Issue

**Title:** Milestone 4: break dataset build-volume import cycle

## Description

Creates shared data-dict helper module and rewires dataset imports to remove build<->dataset_volume coupling.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `754bef010634`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.