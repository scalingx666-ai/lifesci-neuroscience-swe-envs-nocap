# Issue

**Title:** Fix: Bug in Fisher Kernel.

## Description

This fixes the bug when calculating fisher kernel due to recent change of HMM to being fully TensorFlow.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aba8bc86895c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.