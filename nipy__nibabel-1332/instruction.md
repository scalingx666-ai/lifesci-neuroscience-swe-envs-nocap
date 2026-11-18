# Issue

**Title:** RF: Fix `ast` library type and attribute deprecation warnings

## Description

Fix `ast` library type and attribute deprecation warnings.

Fixes:
```
/home/runner/work/nibabel/nibabel/nibabel/nicom/ascconv.py:177:
 DeprecationWarning: ast.Num is deprecated and will be removed in Python 3.14; use ast.Constant instead
  if isinstance(value, ast.Num):

/home/runner/work/nibabel/nibabel/nibabel/nicom/ascconv.py:179:
 DeprecationWarning: ast.Str is deprecated and will be removed in Python 3.14; use ast.Constant instead
  if isinstance(value, ast.Str):

/home/runner/work/nibabel/nibabel/nibabel/nicom/ascconv.py:180:
 DeprecationWarning: Attribute s is deprecated and will be removed in Python 3.14; use value instead
  return value.s

/home/runner/work/nibabel/nibabel/nibabel/nicom/ascconv.py:94:
 DeprecationWarning: Attribute n is deprecated and will be removed in Python 3.14; use value instead
  index = target.slice.n

/home/runner/work/nibabel/nibabel/nibabel/nicom/ascconv.py:182:
 DeprecationWarning: Attribute n is deprecated and will be removed in Python 3.14; use value instead
  return -value.operand.n
```

raised for example in:
https://github.com/nipy/nibabel/actions/runs/9637811213/job/26577586721#step:7:207

Documentation:
https://docs.python.org/3/library/ast.html

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d18022df9657`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.