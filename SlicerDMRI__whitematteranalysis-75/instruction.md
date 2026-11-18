# Issue

**Title:** More build fixes for clean environment

## Description

Namely, this will allow wma to be installed via pip with:

```
pip install git+https://github.com/SlicerDMRI/whitematteranalysis
```

..which gets us very close to pypi-packageable.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `11f2fabdc599`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.