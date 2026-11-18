# Issue

**Title:** RF: Use `numpy.lib.scimath` to demonstrate warning context manager

## Description

Use `numpy.lib.scimath` instead of deprecated `numpy.core.fromnumeric` in `clear_and_catch_warnings` context manager doctests.

Take advantage of the commit to add an actual case that would raise a warning.

Fixes:
```
nibabel/testing/__init__.py::nibabel.testing.clear_and_catch_warnings
  <doctest nibabel.testing.clear_and_catch_warnings[1]>:1:
 DeprecationWarning: numpy.core is deprecated and has been renamed to
 numpy._core. The numpy._core namespace contains private NumPy internals
 and its use is discouraged, as NumPy internals can change without
 warning in any release. In practice, most real-world usage of
 numpy.core is to access functionality in the public NumPy API. If that
 is the case, use the public NumPy API. If not, you are using NumPy
 internals. If you would still like to access an internal attribute, use
 numpy._core.fromnumeric.
```

raised for example at:
https://github.com/nipy/nibabel/actions/runs/9692730430/job/26746686623#step:7:195

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0bd95cd9b593`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.