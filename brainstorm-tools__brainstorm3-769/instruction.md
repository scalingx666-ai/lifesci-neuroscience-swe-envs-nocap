# Issue

**Title:** `GetIsosurfaceData` function to get data from an IsoSurface

## Description

1. This function helps in getting the associated CT volume index and the isoValue from an IsoSurface for a subject. It is just a refactor of existing code (with minor changes to get isoValue).
2. This function will also be helpful in the future for automatic contact localization.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5137f0423853`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.