# Issue

**Title:** Hotfix: bounded encryption backfill batches

## Description

Silent hotfix.
- The encryption backfill reads rows in batches capped at 16 MB (a single larger row goes alone), so a vault with large version histories can no longer exhaust server memory.
- Files inside a folder the server refused to create wait with the folder instead of being uploaded and refused.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `407387dd4bc5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.