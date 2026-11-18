# Issue

**Title:** Expose NSP hardware library version through cbsdk interface.

## Description

This patch exposes the hwlib version of the connected NSP/NPlay.

This is useful because different hwlib version are often incompatibility with each other. If different versions are used to build the library and the NSP firmware, this will cause issues during use. Now there is a way to identify these potential issues in code.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `02d64fc5a6f7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.