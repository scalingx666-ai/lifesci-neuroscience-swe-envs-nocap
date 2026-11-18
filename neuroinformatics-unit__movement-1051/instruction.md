# Issue

**Title:** Add frame_array support to ValidPosesInputs

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

`ValidPosesInputs` currently assumes that frame numbers are contiguous and always start at 0. This makes it difficult to represent pose datasets with non-contiguous frame numbers, which is required for supporting COCO keypoint results and aligns with the existing functionality provided by `ValidBboxesInputs`.

**What does this PR do?**

- Adds optional `frame_array` support to `ValidPosesInputs`. 
- Validates that `frame_array` is a monotonically increasing column vector of shape `(n_frames, 1)`. 
- Adds `frame_array` support to `load_poses.from_numpy()`. 
- Adds tests covering default, custom, invalid, and non-monotonic `frame_array` values, as well as dataset creation with custom frame numbers.

## References

 

## How has this PR been tested?

- Added unit tests covering the new `frame_array` functionality.

- Ran the tests locally

## Is this a breaking change?

No. `frame_array` is optional and defaults to consecutive 0-based frame numbers, preserving the existing behavior.

## Does this PR require an update to the documentation?

Yes
The documentation has been updated to include `frame_array` in `ValidPosesInputs` and `load_poses.from_numpy()`

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ca0085e8aee8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.