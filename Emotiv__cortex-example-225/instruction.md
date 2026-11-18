# Issue

**Title:** COR-5662: fix bug support embedded lib on windows

## Description

The PR include:
- Fix build issue after merge code unity-plugin to master. The issue because the AppUrl is not defined
- Only support embedded lib for standalone windows, do not support for editor because need to build then copy the lib to the build folder  and handle process callback. 

Please help to review. thanks

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0920e1b77aa3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.