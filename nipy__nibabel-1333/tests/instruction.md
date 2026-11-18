# Issue

**Title:** RF: Fix for `abc` library `Traversable` class module

## Description

Fix for `abc` library `Traversable` class module: import from `importlib.resources.abc`.

Fixes:
```
/home/runner/work/nibabel/nibabel/nibabel/testing/__init__.py:30:
 DeprecationWarning: 'importlib.abc.Traversable' is deprecated and slated for removal in Python 3.14
      from importlib.abc import Traversable
```

raised for example at:
https://github.com/nipy/nibabel/actions/runs/9637811213/job/26577586721#step:7:157

Documentation:
https://docs.python.org/3/library/importlib.resources.abc.html#importlib.resources.abc.Traversable

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `adedf7bcf20f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.