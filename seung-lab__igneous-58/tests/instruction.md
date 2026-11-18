# Issue

**Title:** refactor(TransferTask): translation without unaligned writes

## Description

Previous behavior:
Read src image at chunk aligned bounding box and write to offset bounding box--> non-aligned writes

New behavior:
Read src image at offset bounding box (inverted offset) and write to original chunk aligned bounding box

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `52d79400e78e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.