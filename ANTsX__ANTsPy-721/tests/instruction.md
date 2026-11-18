# Issue

**Title:** BUG: Fix slicing. More consistent with numpy

## Description

Fixing slicing issues detailed in #719. The behavior of slicing should now be consistent with what you get on a numpy array, except that it returns an antsImage for slices with dimensions >= 2.

When slicing by indices, direction matrices are collapsed to identity. Users need to call the slice_image function to control that.

I added support for negative indices, so you can do something like `im[:,:,0:-1]` and it behaves as numpy does.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `88437eb4b8a9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.