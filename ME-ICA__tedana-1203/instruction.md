# Issue

**Title:** add warning for when tedana calculates mask

## Description

.

We regularly receive user feedback that the masks calculated within tedana using `nilearns`'s `compute_epi_mask` sometimes removes too many potentially good voxels. Our documented recommendation is that users should provide their own masks.

It's useful to keep existing functionality so that tedana can run without a user-provided mask and we don't break backwards compatibility, but we should make the above message more explicit.

Changes proposed in this pull request:

- Added text recommending users provide their own mask to the CLI and API descriptions for `mask`
- Changed an `LGR.info` to an `LGR.warning` with a more detailed message when an external mask is not provided
- Clarified an `LGR.info` message to state that, when a T2* map and no mask is provided, tedana assumes the T2* map is masked and uses the non-zero values of the map for the mask
- Added a test to make sure the warning appears.

FWIW, in making this PR, I noticed that our integration tests don't include providing a `mask` option besides `None` to `tedana` and don't include providing a T2* map. That's not essential to add now, & is something that should be addressed whenever we get around to doing #920

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fc3784d91edd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.