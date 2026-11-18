# Issue

**Title:** Added an example to dynamically alter the scene in each frame

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [x] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
See https://forum.image.sc/t/brainrender-animation-of-slices/100612

**What does this PR do?**
Adds a new flag to `make_video` to fix the camera to the perspective of the first frame. Otherwise, if the root mesh is sliced throughout the animation the perspective will shift as the centre of mass of the root volume shifts.

Passes the callback function to subsequent frames after the last frame.

Adds an example for how to use a callback function to dynamically alter the scene throughout the Animation.

## How has this PR been tested?
All tests pass locally.

## Is this a breaking change?
No, the new flag is optional and the default provides the previous behaviour.

## Does this PR require an update to the documentation?
Yes, will come in subsequent PR.

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `242dad8a50ec`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.