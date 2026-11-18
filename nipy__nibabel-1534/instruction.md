# Issue

**Title:** BF: Resolve slice starts against axis length in slice_affine

## Description

`SpatialFirstSlicer.slice_affine` copied `subslicer.start` straight into the affine translation. Two cases were therefore wrong:

* A negative start (``img.slicer[-2:]``) put the negative value into the affine instead of the equivalent positive index.
* A negative step with an implicit start (``img.slicer[::-1]``) used 0 as the origin, but the first voxel of the result is the *last* voxel of the axis.

In both cases the returned data was correct while the affine was not, so the image was silently shifted in RAS+ space. ``img.slicer[-2:]`` and ``img.slicer[8:]`` select the same voxels but produced affines 20 mm apart. `nib-roi` is affected too, since it accepts negative starts and ``:-1`` steps and calls `slice_affine` directly.

Resolve each spatial subslicer with `slice.indices()` so the transform is built from the concrete start and step that `dataobj[slicer]` uses.

Closes gh-1533.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e3026a823b46`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.