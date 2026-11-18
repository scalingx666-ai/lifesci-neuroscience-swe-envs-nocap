# Issue

**Title:** find visualizations also in subfolder of exe

## Description

Allows new folder relation:

```
./Studio.exe
./Visualizations/*
```

On top of old:

```
./Studio.exe
./../Visualizations/*
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fe364d5bf690`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.