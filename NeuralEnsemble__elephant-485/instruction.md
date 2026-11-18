# Issue

**Title:** fix Issue #481, ASSET tries to use a backend that is not present in the environment

## Description

This PR introduces a check for openCL similar to `get_cuda_capability_major()` to detect openCL devices.
Issue #481 is addressed with this.

- [x] add regression test

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6ed3cb308978`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.