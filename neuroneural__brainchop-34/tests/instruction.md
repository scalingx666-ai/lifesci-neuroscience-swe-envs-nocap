# Issue

**Title:** buffer leak prevention

## Description

This change hugely helps with chromium based browsers that run very fast on the sequential argmax computation at the last layer and unable to keep up with them tfjs accumulates buffers from already disposed tensors eventually leading to an overload of memory.

With this modification this behavior has not been observed in multiple tests.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `94e40bd1eb42`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.