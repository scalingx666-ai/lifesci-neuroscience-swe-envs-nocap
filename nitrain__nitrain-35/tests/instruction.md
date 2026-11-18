# Issue

**Title:** Fix #34

## Description

Remove type conversion, just use `torchvision.transforms.ToTensor` for that.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `00a41b05d43b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.