# Issue

**Title:** RF: Prefer using `np.vstack` instead of `np.row_stack`

## Description

Prefer using `np.vstack` instead of `np.row_stack`.

Fixes:
```
nibabel/ecat.py: 3 warnings
  /home/runner/work/nibabel/nibabel/nibabel/ecat.py:393:
 DeprecationWarning: `row_stack` alias is deprecated. Use `np.vstack` directly.
    return np.row_stack(mlists)
```

and similar warnings.

Raised for example at:
https://github.com/nipy/nibabel/actions/runs/9637811213/job/26577586721#step:7:186

Documentation:
https://numpy.org/doc/1.26/reference/generated/numpy.row_stack.html

This helps preparing for full Numpy 2.0 compatibility. Documentation: https://numpy.org/doc/stable/numpy_2_0_migration_guide.html#main-namespace

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d18022df9657`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.