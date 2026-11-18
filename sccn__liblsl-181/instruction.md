# Issue

**Title:** Add pthread_getname_np implementation for NDKs missing it

## Description

Not yet tested on a live device, but compiles against the latest NDK.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `08aa186326e9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.