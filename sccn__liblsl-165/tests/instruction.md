# Issue

**Title:** Build MinGW on Windows server 2019

## Description

MinGW build on Github Actions Windows Server 2022 runner failed because CMake was not found in PATH from MSYS2 shell.
CMake is found in Github Actions Windows Server 2019 runner.

For MinGW compilation, exact OS version of the build host is irrelevant.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c7a0f20b5152`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.