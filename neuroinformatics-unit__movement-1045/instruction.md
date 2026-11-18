# Issue

**Title:** Log warning when saving dataset with individual-wise conf to NWB format

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
Since PR #1017, saving datasets with individual-wise confidence values to DLC/LP formats (which support keypoint-wise conf values) will result in a `logger.warning` as we expand the conf values to each keypoint. 
In #1003 we also note that [`save_poses.to_nwb_file`](https://movement.neuroinformatics.dev/latest/api/movement.io.save_poses.to_nwb_file.html) conveniently (but silently) does the same "expansion". 

**What does this PR do?**
This PR adds a similar `logger.warning` when saving poses to NWB format (which also only supports keypoint-wise conf/scores).

## References
#1017 #1003

## How has this PR been tested?
Tests have been added to ensure the warnings are logged.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `722c4f3fca9c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.