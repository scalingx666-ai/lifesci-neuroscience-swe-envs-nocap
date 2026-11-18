# Issue

**Title:** perf: streamlined manifest generation on filesystem

## Description

Use an os.scandir task on filesystems as prefix scans are redundant on FS.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b5c6e528ebc1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.