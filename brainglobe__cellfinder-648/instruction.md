# Issue

**Title:** Remove dead fiji coordinate helper functions

## Description

`cellfinder.core.tools.tools.interchange_np_fiji_coordinates` does not hav a caller. Only its own unit test.

Verified no usage in this repo, `brainglobe-workflows`, or `cellfinder-napari` (latest HEAD).

Two commits:
1. Remove `interchange_np_fiji_coordinates` and its test
2. Remove `swap_elements_list`, which becomes orphaned by commit 1, and its test

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `641c72bd9bca`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.