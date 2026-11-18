# Issue

**Title:** refactor: replace CloudVolume Skeleton with osteoid

## Description

osteoid is a new package using the CloudVolume skeleton code.

This PR will drops the user dependency on CloudVolume.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `977b69609983`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.