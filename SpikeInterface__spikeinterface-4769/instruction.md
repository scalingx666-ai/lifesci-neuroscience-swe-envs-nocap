# Issue

**Title:** Materialize templates array before amp scalings computation for lazy mode

## Description

Noticed this bug when computing amp scalings on a lazy analyzer. The issue was that without materializing the template at init, the zarr array was accessed and decompressed at every spike!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f84f212b32d6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.