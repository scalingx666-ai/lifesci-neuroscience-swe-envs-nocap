# Issue

**Title:** ENH: check for transform instance before writing to file

## Description

Very small pr that checks that the object passed into `write_transform` is actually an antstransform instance and provides a more informative error message.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ee0db0f55c77`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.