# Issue

**Title:** MacOS and Linux Matlab connection fix using spawn start method

## Description

Reverts OpenNFT/OpenNFT#87
Fixes: #37 #81 

We need to use spawned process instead of forked that is used to run Matlab shared engines.

The problem:
Connect to shared Matlab engine will fail when connecting to shared engine created in forked process. Thus, we need to use `spawn` start method to start Matlab helper process (in `MatlabSharedEngineHelper`).

See a minimal code sample should work on Windows and Unix (macOS and Linux):
https://gist.github.com/espdev/30862cd339803925b15801ec1ca35af4

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d4c1bccb2dea`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.