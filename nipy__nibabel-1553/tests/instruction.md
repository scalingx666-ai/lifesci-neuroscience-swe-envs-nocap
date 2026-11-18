# Issue

**Title:** Support (N, N) affines in rescale_affine

## Description

### Summary

`rescale_affine()` documents its `affine` parameter as

> (N, N) array-like
> NxN transform matrix in homogeneous coordinates representing an affine transformation from an (N-1)-dimensional space to an (N-1)-dimensional space.

but the implementation slices `affine[:3, :3]`, so only a 4x4 affine actually works. `voxel_sizes()`, which `rescale_affine()` calls, generalises correctly and returns N - 1 values, so the two disagree and the multiply raises:

```python
>>> import numpy as np
>>> from nibabel.affines import rescale_affine
>>> aff = np.array([[2.0, 0.0, 10.0], [0.0, 3.0, 20.0], [0.0, 0.0, 1.0]])
>>> rescale_affine(aff, (64, 48), (1.0, 1.0))
ValueError: operands could not be broadcast together with shapes (3,3) (2,)
```

The same happens for a 5x5 affine.

### Change

Take the dimensionality from the affine rather than assuming 3. `apply_affine()` and `from_matvec()` are already dimension-agnostic, so nothing else needed adjusting. The 4x4 path is unchanged.

`np.asarray()` is applied to `affine` first so that array-likes work, matching what the docstring promises.

### Tests

Added `test_rescale_affine_2d`, which checks the returned affine has the right shape and zooms and that the documented invariant - the RAS location of the central voxel is preserved - still holds. It fails with a `ValueError` before the change.

`pytest nibabel/tests/test_affines.py` passes (8 passed).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a5b68f4a8cbe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.