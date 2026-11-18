# Issue

**Title:** Fix to vexp CLI

## Description

* inplace argument removed as no longer in spatial.exp
* displacement option should be given as bool, not char

with these fixes, converting a velocity field to a displacement field works well for me.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2c7739ab856f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.