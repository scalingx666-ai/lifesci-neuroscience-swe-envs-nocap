# Issue

**Title:** BUG: wrong origin location in orthoview, update OrthoSlicer3D._set_position in viewers.py

## Description

correct a bug with image.orthoview() from class nibabel.viewers.OrthoSlicer3D

There is a wrong selection of indices from original data using the inverse affine transform, leading to weird selection of voxels

This bug is also related to strange behavior with special acquisition, for example with small animal settings such as rodents where PA and IS axis are transposed (LSA system), leading to wrong location of origin (0,0,0) with image.orthoview()

For example, this small example will generate wrong localization of the referential with the main code and will result in good representation with the proposed correction: 

```python 
data1 = np.random.rand(20, 20, 40)
data1[10, 10, :] = 0
data1[10, :, 30] = 0
data1[:, 10, 30] = 0
aff1 = np.array([[1, 0, 0, -10], [0, 0, 1, -30], [0, 1, 0, -10], [0, 0, 0, 1]])
nib.viewers.OrthoSlicer3D(data1, aff1)
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d15ec583af0b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.