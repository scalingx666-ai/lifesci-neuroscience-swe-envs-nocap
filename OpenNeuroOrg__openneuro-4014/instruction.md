# Issue

**Title:** fix(worker): Restore access tags in set_remote_public

## Description

This was in use by the tag-public script, restores the original functionality and separates the enableremote call into another function.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bd1ca70d03e4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.