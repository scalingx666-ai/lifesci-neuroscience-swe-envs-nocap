# Issue

**Title:** ENH Brain.add_label():  find labels in subfolder

## Description

This would allow

``` Python
brain.add_label('superiortemporal', subdir='aparc')
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e467adef7507`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.