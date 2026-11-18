# Issue

**Title:** perf: accelerate cross section analysis dramatically

## Description

New xs3d version is about 8x faster on its own. It's closer to 10x by using these special features.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7e8deaeff642`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.