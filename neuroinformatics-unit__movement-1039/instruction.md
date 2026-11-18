# Issue

**Title:** Fix `ValidPosesInputs.to_dataset` for datasets with individual-wise confidence arrays

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
 

**What does this PR do?**
- replaces hardcoded 3D confidence array dim names to allow both 2D and 3D depending on `confidence_array.ndim`
- looks up indices by `DIM_NAME` when setting `n_space` and `n_frames` instead of hardcoding indices

## References
#1038 #989

## How has this PR been tested?
`to_dataset` test extended to cover valid poses dataset having individual-wise confidence array - uses existing `valid_poses_dataset_with_individual_wise_conf` fixture.

## Does this PR require an update to the documentation?
Updated `confidence_array` docstring of `_BaseDatasetInputs` to point to subclasses for accurate description of expected shape.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `915792df792e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.