# Issue

**Title:** Expose resetcam parameter

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
Changing the zoom settings in the animation/video examples currently causes the camera to behave poorly.

**What does this PR do?**
Exposes the resetcam parameter in the `Animation`, and `VideoMaker` and sets it to `False` by default. If zoom is used `resetcam` can be set to `True` allowing the camera to behave appropriately.

## References
 
Please reference any existing issues/PRs that relate to this PR.

## How has this PR been tested?
All current tests pass, the `animation_callback.py`, `animation.py`, and `custom_camera.py` all run as expected.
#360 runs correctly as well.

## Is this a breaking change?
No.

## Does this PR require an update to the documentation?
No.

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `551c07951c05`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.