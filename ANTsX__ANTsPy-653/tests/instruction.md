# Issue

**Title:** Fix: raise for bad slice axis; ENH: support slicing vector images

## Description

I realized that setting `axis = -1` in `slice_image()` caused a seg fault, so I am adding better error catching for the axis and supporting the axis=-1 as many other libraries do. I also need to be able to slice vector images so I implemented that.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `12a60d9412a5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.