# Issue

**Title:** chore: Bump pins, update RTD config

## Description

Finally realized that the `requirements.txt` + not bumping the minimum sdcflows means that the unstable image is still using 2.10.0, which has the SyN problems that I have been thinking have been dealt with.

Now they should be.

Fixing RTD build failures in passing.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `64e27fb7f2cd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.