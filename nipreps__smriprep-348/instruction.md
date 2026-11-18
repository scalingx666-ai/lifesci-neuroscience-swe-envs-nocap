# Issue

**Title:** MNT: apply pyupgrade suggestions

## Description

Apply [pyupgrade](https://github.com/asottile/pyupgrade) suggestions:
```
pyupgrade --py38-plus
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b2a434caced4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.