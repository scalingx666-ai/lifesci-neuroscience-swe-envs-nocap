# Issue

**Title:** Handle individual-wise confidence during DLC/LP export

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

Datasets with individual-wise confidence scores could not be exported to `DeepLabCut` (DLC) or `LightningPose` formats. Exporting such datasets resulted in a dimension mismatch error because these formats expect keypoint-wise confidence scores.

**What does this PR do?**

Expands individual-wise confidence scores to keypoint-wise confidence scores by assigning the same confidence value to all keypoints belonging to an individual. Emits a `logger.warning` informing users that the conversion is being performed and that the original individual-wise confidence representation will not be preserved when the exported file is reloaded. Adds tests covering DLC and LightningPose exports with individual-wise confidence scores.

## References

#1003 

## How has this PR been tested?

Reproduced the issue locally using a dataset with individual-wise confidence scores.
Verified that `save_poses.to_dlc_style_df()` no longer raises an exception.
Verified that `save_poses.to_dlc_file()` successfully exports datasets with individual-wise confidence scores.
Verified that `save_poses.to_lp_file()` successfully exports datasets with individual-wise confidence scores.

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

Yes.
This PR introduces a new export behaviour for datasets with individual-wise confidence scores. When exporting to formats that only support keypoint-wise confidence scores, individual-wise confidence scores are expanded to all keypoints belonging to an individual.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cfa1112fdd98`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.