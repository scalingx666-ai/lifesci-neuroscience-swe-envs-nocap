# Issue

**Title:** Support latest emotiv community-sdk

## Description

Emotiv Device Support (INCLUDE_DEVICE_EMOTIV) updates for latest [community-sdk](https://github.com/Emotiv/community-sdk).

This will finally make it possible for users to enable this flag, inject necessary files from the SDK and build Studio with Emotiv SDK support enabled.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c93b3dab5430`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.