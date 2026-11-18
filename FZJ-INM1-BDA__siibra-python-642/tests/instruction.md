# Issue

**Title:** Rounding scheme for neuroglancer fetching needs revision

## Description

When fetching an axis aligned flat volume of interest translating to exactly 1 voxel "thickness" in one dimension, the NeuroglancerScale fetching method rounds up to a 2 voxel array. In my example, fetching in bigbrain space with `Bounding box from (36.58,-0.10,8.33)mm to (38.64,-0.08,11.71)mm in BigBrain microscopic template (histology) space` retrieved an image array of shape (160, 2, 99).

This is critical, since several analysis workflows that I had implemented with siibra rely on the possibility to fetch a 2D patch from properly sized bounding boxes in physical coordinates, and would now confront me to resolve the ambiguity downstream.

The problem is caused by taking `floor`of the minpoint and `ceil` of the max point to compute the target shape as their difference, resulting in a doubling of integer rounding in the extreme case. The suggested change computes the rounded target shape as the `ceil` of the difference of the unrounded max- and midpoints instead, and adds it to the `floor`ed midpoint to obtain the rounded max point, therefore always only triggering a single rounding effect. Using the fix, the aforementioned bounding box yields an array of shape `(160, 1, 98)` after fetching, as expected.

The previous explicit additional clipping of voxel dimensions smaller than 1 seemed incorrect to me, and did not influence the result after the fix anyways, so I removed it.

The proposed change fixes the said problem, but it should be carefully thought through and tested on other examples. I suggest to define a range of standard and border cases of VOIs to double-check that fetching works as expected:
- perfect cube should result in perfect cube
- VOI dimensions equal or smaller to the volume's pixel size (resolution_mm) should result in flat dimensions (dim=1) of the flat array (that's the example reported above)
- VOIs larger than the volume dimensions should be clipped exactly to the max dimension of the volume
- ...

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9f5cbcf2f36a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.