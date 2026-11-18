# Issue

**Title:** [MRG] Added phy download command

## Description

To download a sample dataset. Example:

```
phy download hybrid_120sec.dat -o data/
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `da1566492d41`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.