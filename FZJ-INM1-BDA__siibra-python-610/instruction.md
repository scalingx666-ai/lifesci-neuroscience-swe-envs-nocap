# Issue

**Title:** maint: unify centroid computation

## Description

This PR fixes  by using the robust centroid computation used in `Region.spatial_props()`. Now all centroid computation is done by finding the components of an image with `skimage.measure.label.()` and then finding the center of the non-zero values in the voxel space.

Also:
- `volume.ComponentSpatialProperties` is introduced in place of `region.SpatialPropCmpt`. 
- `region.SpatialProp` is removed since it is not used and was only introduced for typing.
- added tests
- Allow user to not split to components

Not backward compatible:
Instead of using `SpatialProps.components` now the result of `Volume.compute_spatial_props()` is a list of `ComponentSpatialProperties` per component. If the image is not split to components then it will return a single `ComponentSpatialProperties`.


Note: this PR does not address  The root cause of this issue is the concaved geometry of the regions.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9032b43d7ff1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.