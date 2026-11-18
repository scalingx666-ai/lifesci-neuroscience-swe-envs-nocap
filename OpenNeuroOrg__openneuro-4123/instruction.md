# Issue

**Title:** feat(cli): Add cache clear command for inspecting/removing repo caches

## Description

Adds a command to clear the local repo caches used for uploads and downloads with the command line tools.

To clear all the caches:

```shell
openneuro cache clean
```

To list out all the existing caches that would be cleared (can be useful for inspection):
```shell
openneuro cache clean --dry-run
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `021f3ffd8f20`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.