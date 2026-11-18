# Issue

**Title:** FIX toggle_render:  store camera parallel_scale

## Description

`mlab.view()` does not return parallel_scale (which only becomes apparent when setting the camera to use parallel projection)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `69e969b36983`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.