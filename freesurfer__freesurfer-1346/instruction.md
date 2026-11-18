# Issue

**Title:** Fix `torch.quantile` error for SynthStrip, control background value.

## Description

Addresses #1343.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `afe323409326`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.