# Issue

**Title:** RF: Prefer using `getlocale()` instead of `getdefaultlocale()`

## Description

Prefer using `getlocale()` instead of `getdefaultlocale()`.

Fixes:
```
/home/runner/work/nibabel/nibabel/nibabel/cmdline/dicomfs.py:40:
 DeprecationWarning: 'locale.getdefaultlocale' is deprecated and
 slated for removal in Python 3.15. Use setlocale(), getencoding()
 and getlocale() instead.
      encoding = locale.getdefaultlocale()[1]
```

raised for example at:
https://github.com/nipy/nibabel/actions/runs/9637811213/job/26577586721#step:7:164

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d18022df9657`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.