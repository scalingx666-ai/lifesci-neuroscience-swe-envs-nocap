# Issue

**Title:** Fix dim errors in Contrast transform

## Description

The original contrast transform doesn't set keepdim=True in torch.mean. So after performing _input.mean(1), dim 1 will be squeezed and the followed mean(2) will trigger a dim error.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `21507feb258a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.