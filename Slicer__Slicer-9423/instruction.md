# Issue

**Title:** BUG: Fix updateTransformMatrixFromArray toWorld with nested parents

## Description

`slicer.util.updateTransformMatrixFromArray(node, narray, toWorld=True)` computes the matrix to parent as `inv(parentToWorld) * narray`, but it gets `parentToWorld` with `arrayFromTransformMatrix(parentNode)`, which returns the parent's matrix to *its* parent. The result is wrong whenever the parent's transform to world differs from its transform to its own parent.

For example, with a chain `child -> parent -> grandparent`, where the grandparent translates by 100 mm along x and the parent translates by 20 mm along y:

```python
slicer.util.updateTransformMatrixFromArray(child, target, toWorld=True)
slicer.util.arrayFromTransformMatrix(child, toWorld=True)
```

For a `target` that translates by (5, 6, 7), the second call returns a translation of (105, 6, 7). The extra 100 mm is the grandparent's translation.

The fix passes `toWorld=True` when reading the parent matrix. `test_arrayFromTransformMatrix` in `UtilTest.py` only had a single parent, so I extended it with a grandparent transform. The extended test fails without the fix and passes with it.

One behaviour change: if a transform above the parent is nonlinear (I tried a grid transform), the call used to return without an error and now raises `RuntimeError: Failed to get transformation matrix from node <parent node ID>`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4e1fdba30917`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.