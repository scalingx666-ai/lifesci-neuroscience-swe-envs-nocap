# Issue

**Title:** BF+ENH: Fixes to DICOM scaling, make frame filtering explicit

## Description

Fixes how we handle DICOM scaling, particularly for Philips and multi-frame files. For Philips data scale factors without defined units should be avoided, and instead a private tag should be used to make image intensities comparable across series. For multi-frame DICOM, it is possible to have different scale factors (potentially coming from different tags) per-frame. We also prefer scale factors from a RealWorldValueMapping provided they have defined units.

The base Wrapper class now has a few new attributes and methods to support this functionality. In particular an attribute `scale_factors` that provides an array of slope/intercept pairs, and a method `get_unscaled_data` that will return the reordered/reshaped data but without the scaling applied. A `vendor` attribute was also added to better support vendor-specific implementation details.

For the MultiFrameWrapper I also added an attribute `frame_order` which exposes the order used to sort the frames, and use this to return the `scale_factors` in sorted order. While implementing this I kept bumping into issues due to the (implicit) frame filtering that was happening in the `image_shape` property, so I made this filtering explicit and configurable and moved it into the class initialization.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `33c6721e564a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.