# Issue

**Title:** Fixed shuffle bug for multiple input models

## Description

Previously, models with multiple inputs would fail during training due with shuffle=True due to a bug in the shuffler in the multiple input helpers. This quick fix solves this bug.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `21507feb258a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.