# Issue

**Title:** MRG: Add auto offscreen mode

## Description

Adds `offscreen='auto'` as the default, which will use the `mlab.options.offscreen` value.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `23c21b1dba9a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.