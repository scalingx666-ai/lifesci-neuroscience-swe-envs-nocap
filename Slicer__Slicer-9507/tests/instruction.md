# Issue

**Title:** BUG: Fix loading of 2D+t scalar volume sequences from NRRD files

## Description

NRRD files with two domain axes and a list axis (2D+t) with scalar voxels failed to load as a sequence with the error "Unexpected pixel type". For example:

```
dimension: 3
space dimension: 2
sizes: 128 104 5
space directions: (1.15,0) (0,1.15) none
kinds: domain domain list
```

Changes:
- Frames of 2D+t images are now loaded as single-slice 3D volumes. The frame geometry is computed only from the non-sequence axes, with the slice axis orthogonal to the image plane (same as when a single 2D image is loaded). Previously the geometry of 2D+t color and vector images relied on how ITK fills in the list axis.
- Index type and values of the sequence axis are now also read when it is axis 2 (2D+t), not only axis 0 or 3.

Added a test to `vtkMRMLVolumeSequenceStorageNodeNrrdTest` that checks number of frames, frame dimensions, voxel values, IJK to RAS matrix, and index values.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9b1f63a5cf36`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.