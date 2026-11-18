# Issue

**Title:** Optimize image-level filtering of Collections

## Description

Remove map_type, optimize query and add multi indexes

I removed `map_type` because it was a `BaseCollection` level item, therefore we could not make a multi index out of it.

I also don't think it's that important of a filter compared to modality and cogntive atlas, so let's keep things simpler


Replaces #837

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8cebf9f38227`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.